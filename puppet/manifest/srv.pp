node default {
  class { 'sensi::srv': }
  class { 'sensi::collectd': }
}
