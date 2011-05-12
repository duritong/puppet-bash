class bash::linux inherits bash::base {
  package{'bash-completion':
    ensure => present,
    require => Package['bash'],
  }
  include bash::timeout
}
