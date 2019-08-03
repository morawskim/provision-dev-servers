class sensi::docker_swarm_manager {

  class {'sensi::docker': }
  docker::swarm {'cluster_manager':
    init    => true,
    require => Class['sensi::docker']
  }
}
