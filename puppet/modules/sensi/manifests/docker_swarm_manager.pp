class sensi::docker_swarm_manager {
  package { ['docker.io']:
    ensure => present
  }

  docker::swarm {'cluster_manager':
    init    => true,
    require => Package['docker.io']
  }

  service {'docker':
    ensure  => running,
    enable  => true,
    require => Package['docker.io']
  }
}
