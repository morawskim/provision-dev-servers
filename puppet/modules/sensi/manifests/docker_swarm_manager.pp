class sensi::docker_swarm_manager {
  docker::swarm {'cluster_manager':
    init    => true,
    require => Class['sensi::docker']
  }
}
