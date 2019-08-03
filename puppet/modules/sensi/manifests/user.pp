define sensi::user(
    Array $groups = [],
    $ssh_authorized_keys = {},
) {
  group {$name: }

  user {$name:
    ensure => present,
    home => "/home/${name}",
    purge_ssh_keys => true,
    managehome => true,
    shell => lookup('user_default_shell'),
    gid => $name,
    groups => $groups,
    require => [Group[$name]]
  }

  create_resources('ssh_authorized_key', $ssh_authorized_keys, {'user' => $name})
  User<| name == $name |> -> Ssh_authorized_key<| user == $name |>
}
