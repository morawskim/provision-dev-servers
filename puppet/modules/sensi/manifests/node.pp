class sensi::node {
  package { ['etcd', 'etcd-client']:
    ensure => present
  }

  service {'etcd':
    ensure  => running,
    enable  => true,
    require => Package['etcd']
  }

  class {'sensi::nginx': }
}
