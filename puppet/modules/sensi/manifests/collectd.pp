class sensi::collectd {
  package { ['collectd']:
    ensure => present
  }

  service {'collectd':
    ensure  => running,
    enable  => true,
    require => Package['collectd']
  }
}
