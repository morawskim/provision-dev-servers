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
}
