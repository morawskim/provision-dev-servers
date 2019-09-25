class sensi::duplicity_service (
  String $ftp_password,
  Stdlib::Absolutepath $dir,
  String $url,
) {

  systemd::unit_file { 'duplicity.timer':
    content => template('sensi/systemd/duplicity/duplicity.timer.erb'),
    mode    => '0400',
    require => Systemd::Unit_file['duplicity.service']
  }

  systemd::unit_file { 'duplicity.service':
    mode    => '0400',
    content => template('sensi/systemd/duplicity/duplicity.service.erb'),
  }

  service {'duplicity.service':
    ensure  => stopped,
    enable  => true,
    require => Systemd::Unit_file['duplicity.service']
  }

  service {'duplicity.timer':
    ensure  => running,
    enable  => true,
    require => [Systemd::Unit_file['duplicity.timer'], Service['duplicity.service']]
  }
}
