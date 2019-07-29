node default {
  class { 'sensi::gitlab_runner': }
  class { 'sensi::collectd': }
}
