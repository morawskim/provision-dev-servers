class sensi::docker_stack::nexus(
    String $traefik_frontend_rule
) {
  $docker_swarm_file = '/root/nexus-swarm.yml'
  file {$docker_swarm_file:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template('sensi/docker-swarm/nexus-swarm.yml.erb')
  }

  docker_stack { 'nexus':
    ensure        => present,
    compose_files => [$docker_swarm_file],
    require       => [Class['sensi::docker_swarm_manager'], File[$docker_swarm_file]],
  }
}
