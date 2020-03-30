class sensi::docker_stack::monitoring(
    String $prometheus_frontend_rule,
    String $grafana_frontend_rule,
) {
  $docker_swarm_file = '/root/monitoring-swarm.yml'
  file {$docker_swarm_file:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template('sensi/docker-swarm/monitoring.yml.erb'),
  }
  file {'/tmp/prometheus.yml':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('sensi/prometheus/prometheus.yml.erb'),
    notify  => Docker_compose['monitoring'],
  }

  docker_compose { 'monitoring':
    ensure        => present,
    compose_files => [$docker_swarm_file],
    require       => [Class['sensi::docker'], File[$docker_swarm_file], Package['docker-compose']],
  }
}
