class bash::timeout::debian {
  line{'timeout':
    file => '/etc/profile',
    line => 'export TMOUT=900',
  }
}
