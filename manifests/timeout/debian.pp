class bash::timeout::debian {
  file_line{'timeout':
    path => '/etc/profile',
    line => 'export TMOUT=900',
  }
}
