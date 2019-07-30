node default {
  class { 'sensi::docker_swarm_manager': }
  class { 'sensi::timezone':
    timezone => lookup('timezone'),
  }
}
