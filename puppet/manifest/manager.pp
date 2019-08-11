node default {
  class { 'sensi::docker_swarm_manager': }
  class { 'sensi::collectd': }
  class { 'sensi::traefik': }
  class { 'sensi::timezone':
    timezone => lookup('timezone'),
  }
  class {'sensi::provision_repo': }
  @sensi::user {'deployer':
    ssh_authorized_keys => lookup('ssh_keys')['deployer'],
    groups => [docker],
    require => Class['sensi::docker_swarm_manager']
  }
  realize Sensi::User['deployer']
}
