class sensi::timezone (
    String $timezone
) {
  file { '/etc/localtime':
      ensure => link,
      target => "/usr/share/zoneinfo/${timezone}"
  }
}
