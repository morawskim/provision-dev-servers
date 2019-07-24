node default {
  package { ['virtualbox', 'vagrant']:
    ensure => present
  }
}
