# lang fixes
class bash::lang{
  line{
    'lang_in_env':
      line => 'LANG=en_US.UTF-8',
      file => '/etc/environment';
    'env_in_profile':
      line => '. /etc/environment',
      file => '/etc/profile',
      require => Line['lang_in_env'];
  }
}
