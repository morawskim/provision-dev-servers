class sensi::cockpit {

  package { ['cockpit', 'cockpit-docker', 'cockpit-packagekit', 'cockpit-machines']:
    ensure => present
  }
}
