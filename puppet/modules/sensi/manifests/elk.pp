class sensi::elk {

  package { 'apt-transport-https':
      ensure => present
  }

  apt::source { 'elastic':
    location => 'https://artifacts.elastic.co/packages/7.x/apt',
    release  => 'stable',
    repos    => 'main',
    key      => {
      id     => '46095ACC8548582C1A2699A9D27D666CD88E42B4',
      source => 'https://artifacts.elastic.co/GPG-KEY-elasticsearch'
    },
    require => Package['apt-transport-https']
  }

  package {'elasticsearch':
    ensure  => present,
    require => Apt::Source['elastic']
  }

  package {'kibana':
    ensure  => present,
    require => Package['elasticsearch']
  }

  package {'logstash':
    ensure  => present,
    require => Package['kibana']
  }

  service {'elasticsearch':
    ensure  => running,
    enable  => true,
    require => Package['elasticsearch']
  }

  service {'kibana':
    ensure  => running,
    enable  => true,
    require => Package['kibana']
  }

  service {'logstash':
    ensure  => running,
    enable  => true,
    require => Package['logstash']
  }

  yaml_setting { 'kibana listen on all interfaces':
    target => '/etc/kibana/kibana.yml',
    key    => 'server.host',
    value  => '0.0.0.0',
    notify => Service['kibana']
  }
}
