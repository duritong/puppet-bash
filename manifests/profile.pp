# manage a bash profile
define bash::profile(
  $source,
  $destination = '/root/.bash_profile',
  $uid         = root,
  $gid         = 0
){
  file {$name:
    path   => $destination,
    source =>   [
      "puppet:///modules/site_bash/${::fqdn}/${source}",
      "puppet:///modules/site_bash/${source}",
      "puppet:///modules/bash/${source}"
    ],
    owner => $uid,
    group => $gid,
    mode  => '0600';
  }
}
