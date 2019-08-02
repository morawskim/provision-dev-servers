node default {
  class { 'sensi::gitlab_runner': }
  class { 'sensi::collectd': }
  class { 'sensi::timezone':
    timezone => lookup('timezone'),
  }
  class {'sensi::provision_repo': }
}
