class sensi::collectd {
  package { ['collectd']:
    ensure => present
  }

  service {'collectd':
    ensure  => running,
    enable  => true,
    require => Package['collectd']
  }

  file {'/etc/collectd/collectd.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('sensi/collectd/collectd.conf.erb'),
    require => Package['collectd'],
    notify  => Service['collectd']
  }
}
