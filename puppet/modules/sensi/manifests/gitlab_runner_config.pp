define sensi::gitlab_runner_config (
    String $url,
    Hash[String, String] $tokens
) {

  file {'/etc/gitlab-runner/config.toml':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template('sensi/gitlab/mmo-runner.toml.erb'),
  }
}
