class sensi::node {
  package { ['etcd', 'etcd-client', 'nginx-full']:
    ensure => present
  }

  service {'nginx':
    ensure  => running,
    enable  => true,
    require => Package['nginx-full']
  }

  service {'etcd':
    ensure  => running,
    enable  => true,
    require => Package['etcd']
  }
}
