class sensi::trivy {
  include sensi::apt_transport_https
  include sensi::gnupg

  apt::source { 'trivy':
    location => 'https://aquasecurity.github.io/trivy-repo/deb',
    release  => 'bionic',
    repos    => 'main',
    key      => {
      id     => '2E2D3567461632C84BB6CD6FE9D0A3616276FA6C',
      source => 'https://aquasecurity.github.io/trivy-repo/deb/public.key'
    },
    require  => [Class['sensi::apt_transport_https'], Class['sensi::gnupg']]
  }

  package {'trivy':
    ensure  => present,
    require => Apt::Source['trivy']
  }
}
