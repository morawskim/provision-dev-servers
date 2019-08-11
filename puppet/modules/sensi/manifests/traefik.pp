class sensi::traefik {
  docker_network { 'traefik':
    ensure   => present,
    driver   => 'overlay',
    additional_flags => '--attachable',
    require  => Class['sensi::docker']
  }

  $docker_swarm_file = '/root/traefik-swarm.yml'
  file {$docker_swarm_file:
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => '0640',
    content => template('sensi/traefik-swarm.yml.erb')
  }

  docker_stack { 'traefik':
    ensure  => present,
    compose_files => [$docker_swarm_file],
    require => [Class['sensi::docker'], File[$docker_swarm_file]],
  }
}
