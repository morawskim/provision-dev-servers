class sensi::srv {
  package { ['virtualbox', 'vagrant']:
    ensure => present
  }

  user {'marcin':
    ensure => present,
    home => '/home/marcin',
    purge_ssh_keys => true,
    managehome => true,
    gid => 'marcin',
    groups => [adm, cdrom, sudo, dip, plugdev, lxd],
    require => [Package['virtualbox']]
  }

  ssh_authorized_key { 'marcin.morawski@sensilabs.pl':
    ensure => present,
    user   => 'marcin',
    type   => lookup('ssh_keys')['marcin.morawski@sensilabs.pl']['type'],
    key    => lookup('ssh_keys')['marcin.morawski@sensilabs.pl']['key'],
    require => [User['marcin']]
  }

  group {'tomek': }

  user {'tomek':
    ensure => present,
    home => '/home/tomek',
    purge_ssh_keys => true,
    managehome => true,
    gid => 'tomek',
    groups => [adm, cdrom, sudo, dip, plugdev, lxd],
    require => Group['tomek']
  }

  ssh_authorized_key { 'tomasz.zalewski@sensilabs.pl':
    ensure => present,
    user   => 'tomek',
    type   => lookup('ssh_keys')['tomasz.zalewski@sensilabs.pl']['type'],
    key    => lookup('ssh_keys')['tomasz.zalewski@sensilabs.pl']['key'],
    require => [User['tomek']]
  }
}
