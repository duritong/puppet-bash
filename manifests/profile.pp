define bash::profile(
    $source,
    $destination = '/root/.bash_profile',
    $uid = root,
    $gid = 0 
){
  file {$name:
    path => $destination,
    source =>   [ 
      "puppet://$server/modules/site-bash/${fqdn}/${source}",
      "puppet://$server/modules/site-bash/${source}",
      "puppet://$server/modules/bash/module/${source}",
      "puppet://$server/modules/bash/${source}"
    ],
    owner => $uid, group => $gid, mode => 600;
  } 
}
