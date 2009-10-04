class bash::centos inherits bash::base {
  package{ [ 'bash-completion', 'rootfiles']:
    ensure => present,
  }
  bash::profile{bash_profile_root: source => 'centos' }
  include bash::timeout
}
