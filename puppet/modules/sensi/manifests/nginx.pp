class sensi::nginx {
  package { ['nginx-full']:
    ensure => present
  }

  service {'nginx':
    ensure  => running,
    enable  => true,
    require => Package['nginx-full']
  }

  file {'/etc/nginx/sites-enabled/default':
    ensure => absent,
    require => Package['nginx-full'],
    notify => Service['nginx']
  }

  file {'/etc/nginx/sites-enabled/proxy':
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => '0644',
    content => template('sensi/nginx/proxy.erb'),
    require => Package['nginx-full'],
    notify => Service['nginx']
  }
}
