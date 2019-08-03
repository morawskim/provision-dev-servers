class sensi::docker {
  package { ['docker.io']:
    ensure => present
  }

  service {'docker':
    ensure  => running,
    enable  => true,
    require => Package['docker.io']
  }
}
