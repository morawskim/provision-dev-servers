class sensi::docker_swarm_manager {
  package { ['docker.io']:
    ensure => present
  }

  docker::swarm {'cluster_manager':
    init           => true,
  }    
}
