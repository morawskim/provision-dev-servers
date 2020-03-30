node default {
  class { 'sensi::collectd': }
  class { 'sensi::timezone':
    timezone => lookup('timezone'),
  }
  class {'sensi::provision_repo': }
  class {'sensi::docker': }

  package {'docker-compose':
    ensure => present
  }
  class { 'sensi::docker_stack::monitoring': }
}
