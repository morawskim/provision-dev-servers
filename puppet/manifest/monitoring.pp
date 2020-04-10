node default {
  class { 'sensi::admins': }
  class { 'sensi::collectd': }
  class { 'sensi::timezone':
    timezone => lookup('timezone'),
  }
  class {'sensi::provision_repo': }
  class {'sensi::docker':
    users_to_manage_docker => ['marcin']
  }

  package {'docker-compose':
    ensure => present
  }
  class { 'sensi::docker_stack::monitoring': }
  class { 'sensi::docker_stack::cadvisor':
    provider => 'compose',
    require  => Package['docker-compose'],
  }

  realize Sensi::User['marcin']
  realize Sensi::User['tomasz']
}
