class sensi::gitlab_runner {
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
    require  => [Class['sensi::apt_transport_https'], Class['sensi::gnupg'], Apt::Pin['gitlab-runner']]
  }

  apt::pin { 'gitlab-runner':
    explanation => 'Prefer GitLab provided packages over the Debian native ones',
    packages => ['gitlab-runner'],
    priority => 1001,
    origin => 'packages.gitlab.com'
  }

  package {'gitlab-runner':
    ensure  => present,
    require => [ Apt::Source['gitlab-runner'], Class['apt::update'] ]
  }

  service {'gitlab-runner':
    ensure  => running,
    enable  => true,
    require => Package['gitlab-runner']
  }

  User<| title == 'gitlab-runner' |> { require +> Package['gitlab-runner'] }
  realize User['gitlab-runner']
}
