class sensi::user::gitlab_runner {
  @user {'gitlab-runner':
    ensure  => present,
    gid     => 'gitlab-runner',
    groups  => []
  }
}
