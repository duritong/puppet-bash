define bash::profile(
    $source,
    $destination = '/root/.bash_profile',
    $uid = root,
    $gid = 0 
){
  file {$name:
    path => $destination,
    source =>   [ 
      "puppet:///modules/site-bash/${fqdn}/${source}",
      "puppet:///modules/site-bash/${source}",
      "puppet:///modules/bash/module/${source}",
      "puppet:///modules/bash/${source}"
    ],
    owner => $uid, group => $gid, mode => 600;
  } 
}
