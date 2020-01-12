class sensi::nullmailer (
    String $remote,
    String $admin_addr,
    String $me,
) {

  $owner = $::operatingsystem ? {
    /(?i:suse)/  => 'nullmailer',
    /(?i:ubuntu|debian)/ => 'mail',
    default => fail("Not supported OS - ${::operatingsystem}"),
  }

  package { ['nullmailer']:
    ensure => present
  }

  service { 'nullmailer':
    ensure  => running,
    enable  => true,
    require => Package['nullmailer']
  }

  file { '/etc/nullmailer/adminaddr':
    ensure  => present,
    content => $admin_addr,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service['nullmailer'],
  }

  file { '/etc/nullmailer/remotes':
    ensure  => present,
    content => $remote,
    owner   => $owner,
    group   => $owner,
    mode    => '0600',
    notify  => Service['nullmailer'],
  }

  file { '/etc/nullmailer/me':
    ensure  => present,
    content => $::fqdn,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service['nullmailer'],
  }

  file { '/etc/nullmailer/defaulthost':
    ensure  => present,
    content => $me,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service['nullmailer'],
  }

  file { '/etc/nullmailer/defauldomain':
    ensure  => present,
    content => $me,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service['nullmailer'],
  }

  file { '/etc/mailname':
    ensure  => present,
    content => $::fqdn,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service['nullmailer'],
  }
}
