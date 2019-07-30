node default {
  class { 'sensi::docker_swarm_manager': }
  class { 'sensi::collectd': }
  class { 'sensi::timezone':
    timezone => lookup('timezone'),
  }
}
