node default {
  class { 'sensi::elk': }
  class { 'sensi::collectd': }
  class { 'sensi::timezone':
    timezone => lookup('timezone'),
  }
  class {'sensi::provision_repo': }
}
