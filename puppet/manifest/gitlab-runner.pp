node default {
  class { 'sensi::gitlab_runner': }
  class { 'sensi::collectd': }
  class { 'sensi::timezone':
    timezone => lookup('timezone'),
  }
  class {'sensi::provision_repo': }
  sensi::gitlab_runner_config {'mmo-docker':
    * => lookup('gitlab_runners')['mmo'],
    require => Package['gitlab-runner'],
    notify => Service['gitlab-runner']
  }
}
