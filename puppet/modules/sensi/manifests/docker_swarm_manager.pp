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

  group {'deployer': }

  user {'deployer':
    ensure => present,
    home => '/home/deployer',
    purge_ssh_keys => true,
    managehome => true,
    shell => lookup('user_default_shell'),
    gid => 'deployer',
    groups => [docker],
    require => [Group['deployer'], Package['docker.io']]
  }

  ssh_authorized_key { 'ssorder-deploy':
    ensure => present,
    user   => 'deployer',
    type   => lookup('ssh_keys')['ssorder-deploy']['type'],
    key    => lookup('ssh_keys')['ssorder-deploy']['key'],
    require => [User['deployer']]
  }
}
