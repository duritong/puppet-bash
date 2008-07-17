#
# bash module
#
# Copyright 2008, admin(at)immerda.ch
# Copyright 2008, Puzzle ITC GmbH
# Marcel Härry haerry+puppet(at)puzzle.ch
# Simon Josi josi+puppet(at)puzzle.ch
#
# This program is free software; you can redistribute 
# it and/or modify it under the terms of the GNU 
# General Public License version 3 as published by 
# the Free Software Foundation.
#

#modules_dir { "bash": }

class bash {
    case $operatingsystem {
        openbsd: { include bash::openbsd }
        centos: { include bash::centos }
        default: { include bash::base }
    }
}

class bash::base {
    package{bash:
        ensure => present,
    }
}


class bash::centos inherits bash::base {
    package{'bash-completion':
        ensure => present,
    }
    bash::deploy_profile{bash_profile_root: source => 'centos' }
}

class bash::openbsd inherits bash::base {

	package{'libiconv':
	    ensure => present,
		source => 'ftp://mirror.switch.ch/pub/OpenBSD/${operatingsystemrelease}/packages/${hardwaremodel}/',
	}

	package {'gettext':
        ensure => present,
		source => 'ftp://mirror.switch.ch/pub/OpenBSD/${operatingsystemrelease}/packages/${hardwaremodel}/',
		require => Package[libiconv],
	}

    Package[bash]{
        ensure => present,
		source => 'ftp://mirror.switch.ch/pub/OpenBSD/${operatingsystemrelease}/packages/${hardwaremodel}/',
        require => Package[gettext],
    }
    bash::deploy_profile{bash_profile_root: source => 'openbsd' }
}

define bash::deploy_profile(
    $source,
    $destination = '/root/.bash_profile',
    $uid = 'root',
    $gid = '0' ){

    file {$name:
                path => $destination,
                owner => $uid,
                group => $gid,
                mode => 600,
                source =>   [
                    "puppet://$server/files/bash/${fqdn}/${source}",
                    "puppet://$server/files/bash/${source}",
                    "puppet://$server/bash/module/${source}",
                    "puppet://$server/bash/${source}"
                ],
        }
}
