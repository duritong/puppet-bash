class bash::openbsd inherits bash::base {
  package{'libiconv':
    ensure => present,
  }

  package {'gettext':
    ensure => present,
    require => Package[libiconv],
  }

  Package[bash]{
    ensure => present,
    require => Package[gettext],
  }
  bash::profile{bash_profile_root: source => 'openbsd' }
}
