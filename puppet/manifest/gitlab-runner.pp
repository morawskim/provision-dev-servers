node default {
  class { 'sensi::gitlab_runner': }
  class { 'sensi::packer': }
  class { 'sensi::trivy': }
  class { 'sensi::collectd': }
  class {'sensi::docker':
    users_to_manage_docker => ['gitlab-runner'],
    docker_registries      => lookup('docker_registries'),
  }
  class { 'sensi::timezone':
    timezone => lookup('timezone'),
  }
  class { 'sensi::virtualbox':
    users_to_manage_vbox => ['gitlab-runner']
  }
  class { 'sensi::user::gitlab_runner':
  }
  class {'sensi::provision_repo': }
  sensi::gitlab_runner_config {'mmo-docker':
    *       => lookup('gitlab_runners')['mmo'],
    require => Package['gitlab-runner'],
    notify  => Service['gitlab-runner']
  }
  package {['curl', 'jq', 'vagrant']:
      ensure => 'present'
  }
}
