class sensi::docker_swarm_manager {

  class {'sensi::docker': }
  docker::swarm {'cluster_manager':
    init    => true,
    require => Class['sensi::docker']
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
    require => [Group['deployer'], Class['sensi::docker']]
  }

  ssh_authorized_key { 'ssorder-deploy':
    ensure => present,
    user   => 'deployer',
    type   => lookup('ssh_keys')['ssorder-deploy']['type'],
    key    => lookup('ssh_keys')['ssorder-deploy']['key'],
    require => [User['deployer']]
  }
}
