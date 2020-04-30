class sensi::docker_stack::cadvisor(
  Enum['stack', 'compose'] $provider
) {
  $docker_swarm_file = '/root/cadvisor-swarm.yml'
  file {$docker_swarm_file:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template('sensi/docker-swarm/cadvisor.yml.erb'),
  }

  if $provider == 'stack' {
    docker_stack { 'cadvisor':
      ensure        => present,
      compose_files => [$docker_swarm_file],
      require       => [
        Class['sensi::docker_swarm_manager'],
        File[$docker_swarm_file],
      ],
    }
  } else {
    docker_compose { 'cadvisor':
      ensure        => present,
      compose_files => [$docker_swarm_file],
      require       => [
        Class['sensi::docker'],
        File[$docker_swarm_file],
      ],
    }
  }
}
