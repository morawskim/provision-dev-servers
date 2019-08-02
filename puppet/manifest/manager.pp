node default {
  class { 'sensi::docker_swarm_manager': }
  class { 'sensi::collectd': }
  class { 'sensi::timezone':
    timezone => lookup('timezone'),
  }
  class { 'sensi::node':
    require => Class['sensi::docker_swarm_manager']
  }
  class {'sensi::provision_repo': }
}
