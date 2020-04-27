class sensi::gitlab_runner {
  class {'sensi::docker': }
  include sensi::apt_transport_https
  include sensi::gnupg

  apt::source { 'gitlab-runner':
    location => 'https://packages.gitlab.com/runner/gitlab-runner/ubuntu/',
    release  => 'bionic',
    repos    => 'main',
    key      => {
      id     => 'F6403F6544A38863DAA0B6E03F01618A51312F3F',
      source => 'https://packages.gitlab.com/gpg.key'
    },
    require  => [Class['sensi::apt_transport_https'], Class['sensi::gnupg']]
  }

  package {'gitlab-runner':
    ensure  => present,
    require => Apt::Source['gitlab-runner']
  }

  service {'gitlab-runner':
    ensure  => running,
    enable  => true,
    require => Package['gitlab-runner']
  }

  user {'gitlab-runner':
    ensure  => present,
    gid     => 'gitlab-runner',
    groups  => ['docker'],
    require => [Package['gitlab-runner'], Class['sensi::docker']]
  }
}
