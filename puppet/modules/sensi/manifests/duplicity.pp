class sensi::duplicity {
  package {['duplicity', 'lftp']:
    ensure => present
  }
}
