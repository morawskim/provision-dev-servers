class sensi::virtualbox(
    Array $users_to_manage_vbox = []
) {
  include sensi::linux_headers

  package {'virtualbox':
    ensure  => present,
    require => Class['sensi::linux_headers']
  }

  service {'virtualbox':
    ensure  => running,
    enable  => true,
    require => Package['virtualbox']
  }

  $users_to_manage_vbox.each |String $user| {
    User<| title == $user |> { groups +> "vboxusers", require +> Package['virtualbox'] }
  }
}
