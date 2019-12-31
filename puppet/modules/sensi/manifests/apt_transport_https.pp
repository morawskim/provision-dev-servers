class sensi::apt_transport_https {
  package {'apt-transport-https':
    ensure => present
  }
}
