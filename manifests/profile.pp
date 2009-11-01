define bash::profile(
    $source,
    $destination = '/root/.bash_profile',
    $uid = root,
    $gid = 0 
){
  file {$name:
    path => $destination,
    source =>   [ 
      "puppet://$server/files/bash/${fqdn}/${source}",
      "puppet://$server/files/bash/${source}",
      "puppet://$server/modules/bash/module/${source}",
      "puppet://$server/modules/bash/${source}"
    ],
    owner => $uid, group => $gid, mode => 600;
  } 
}
