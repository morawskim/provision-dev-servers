class sensi::docker (
    Array $users_to_manage_docker = [],
    $docker_registries = {},
){
  package { ['docker.io']:
    ensure => present
  }

  service {'docker':
    ensure  => running,
    enable  => true,
    require => Package['docker.io']
  }

  $users_to_manage_docker.each |String $user| {
    User<| title == $user |> { groups +> "docker", require +> Package['docker.io'] }
  }

  create_resources(
    'docker::registry',
    $docker_registries,
    { require => Service['docker'] }
  )
}
