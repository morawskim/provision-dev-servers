class sensi::admins {
  @sensi::user {'marcin':
    ssh_authorized_keys => {marcin => lookup('ssh_keys')['marcin.morawski@sensilabs.pl']},
    groups              => [adm, sudo],
  }

  @sensi::user {'tomasz':
    ssh_authorized_keys => {tomasz => lookup('ssh_keys')['tomasz.zalewski@sensilabs.pl']},
    groups              => [adm, sudo],
  }
}
