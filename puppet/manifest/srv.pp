node default {
  class { 'sensi::kvm': }
  class { 'sensi::admins': }
  class { 'sensi::collectd': }
  class { 'sensi::timezone':
    timezone => lookup('timezone'),
  }
  class { 'sensi::cockpit': }
  class {'sensi::provision_repo': }
  class {'sensi::duplicity': }
  class {'sensi::nullmailer': }
  class {'sensi::duplicity_service':
    ftp_password => lookup('backup')['password'],
    dir          => lookup('backup')['dir'],
    url          => lookup('backup')['url'],
  }

  realize Sensi::User['marcin']
  realize Sensi::User['tomasz']

  package { 'vagrant':
    ensure => present
  }
}
