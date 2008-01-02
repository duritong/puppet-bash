# modules/bash/manifests/init.pp - manage bash stuff
# Copyright (C) 2007 admin@immerda.ch
#

modules_dir { "bash": }

class bash {

        case $operatingsystem {
                OpenBSD: {
			 package { 'bash':
		                ensure => 'present',
		                source => 'ftp://mirror.switch.ch/pub/OpenBSD/4.2/packages/i386/bash-3.2.17.tgz',
        		}
                }
                default: {
                }
        }


}

bash::deploy_profile( 
	$source, 
	$destination = '/root/.bash_profile',
	$uid    = 'root',
        $gid    = '0' ){

        file {$name:
                path => $target,
                owner => $uid,
                group => $gid,
                mode => 600,
                source => "puppet://$server/bash/${source}",
        }
}
