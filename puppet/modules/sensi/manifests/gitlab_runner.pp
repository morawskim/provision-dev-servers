class sensi::gitlab_runner {
  class {'sensi::docker': }
  include sensi::apt_transport_https
  include sensi::gnupg

  apt::source { 'gitlab-runner':
    location => 'https://packages.gitlab.com/runner/gitlab-runner/ubuntu/',
    release  => 'bionic',
    repos    => 'main',
    key      => {
      id     => '1A4C919DB987D435939638B914219A96E15E78F4',
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
