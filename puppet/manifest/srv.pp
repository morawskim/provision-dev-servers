node default {
  class { 'sensi::srv': }
  class { 'sensi::collectd': }
  class { 'sensi::timezone':
    timezone => lookup('timezone'),
  }
  class {'sensi::provision_repo': }
  class {'sensi::duplicity': }
  class {'sensi::nullmailer': }
  class {'sensi::duplicity_service':
    ftp_password => lookup('backup')['password'],
    dir          => lookup('backup')['dir'],
    url          => lookup('backup')['url'],
  }
}
