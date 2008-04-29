# modules/bash/manifests/init.pp - manage bash stuff
# Copyright (C) 2007 admin@immerda.ch
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

}

class bash::openbsd inherits bash::base {

	package{'libiconv':
	    ensure => 'present',
		source => 'ftp://mirror.switch.ch/pub/OpenBSD/4.2/packages/i386/libiconv-1.9.2p3.tgz'
	}

	package {'gettext':
	    ensure => 'present',
		source => 'ftp://mirror.switch.ch/pub/OpenBSD/4.2/packages/i386/gettext-0.14.6p0.tgz',
		require => Package[libiconv],
	}
    Package[bash]{
	    source => 'ftp://mirror.switch.ch/pub/OpenBSD/4.2/packages/i386/bash-3.2.17.tgz',
        require => Package[gettext],
    }
    bash::deploy_profile{bash_profile_root: source => 'openbsd' }
}

define bash::deploy_profile( 
	$source, 
	$destination = '/root/.bash_profile',
	$uid    = 'root',
        $gid    = '0' ){

        file {$name:
                path => $destination,
                owner => $uid,
                group => $gid,
                mode => 600,
                source => "puppet://$server/bash/${source}",
        }
}
