node default {
  package { ['virtualbox', 'vagrant']:
    ensure => present
  }

  user {'marcin':
    ensure => present,
    home => '/home/marcin',
    purge_ssh_keys => true,
    gid => 'marcin',
    groups => [adm, cdrom, sudo, dip, plugdev, lxd],
    require => [Package['virtualbox']]
  }

  ssh_authorized_key { 'marcin.morawski@sensilabs.pl':
    ensure => present,
    user   => 'marcin',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDZDsJ38k7nRmVqGLUIpctPHW+Keo4v6eF3MFqVzgRImaspB+hfI/2zP5PjMiTxtVSkMOPSrii2hgSdFA5wElrK5JW7XFNWdNvky/d/Df0VBCADO5I7fRg3kfUDOG+GGLCzYZvfLyZ+EsveJ0Q65Pe24W51lZ28I48LedYEjXfgZ0yoDDCa8MEQH58Id1QZKFi/sR+bgHBqug3zARO/fQIebkmD3BCssahGzxOpWo8n1FrRDxw0vcF9urghm+P4aemDBPf+NOCJguDjwFaWhxQzAK/AMNo8CaEY+rMabFLMwGXUw1TPWXl48i71UzCk/Gdd9KW+aY4g7Pk4pTHLJkw9',
    require => [User['marcin']]
  }
}
