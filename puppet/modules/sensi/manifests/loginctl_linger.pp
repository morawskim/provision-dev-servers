define sensi::loginctl_linger(
  String $username
) {
  exec { 'enable_linger':
    command => "/bin/loginctl enable-linger ${username}",
    creates => "/var/lib/systemd/linger/${username}"
  }
}

