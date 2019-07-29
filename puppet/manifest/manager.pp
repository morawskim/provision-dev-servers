node default {
  package { ['docker.io']:
    ensure => present
  }

  docker::swarm {'cluster_manager':
    init           => true,
  }
}
