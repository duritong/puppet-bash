class bash::centos inherits bash::linux {
  package{'rootfiles':
    ensure => present,
  }
  bash::profile{bash_profile_root: source => 'centos' }
}
