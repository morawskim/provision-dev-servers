node default {
  class {'sensi::docker':
    users_to_manage_docker => ['marcin', 'deployer']
  }

  class { 'sensi::admins': }
  class { 'sensi::docker_swarm_manager': }
  class { 'sensi::collectd': }
  class { 'sensi::docker_stack::traefik': }
  class { 'sensi::docker_stack::monitoring': }
  class { 'sensi::docker_stack::nexus': }
  class { 'sensi::docker_stack::cadvisor':
    provider => 'stack'
  }
  class { 'sensi::timezone':
    timezone => lookup('timezone'),
  }
  class {'sensi::provision_repo': }

  @sensi::user {'deployer':
    ssh_authorized_keys => lookup('ssh_keys')['deployer'],
    groups              => [],
  }

  realize Sensi::User['deployer']
  realize Sensi::User['marcin']
  realize Sensi::User['tomasz']

  sensi::loginctl_linger {'deployer':
    username => 'deployer',
    require  => Sensi::User['deployer']
  }
}
