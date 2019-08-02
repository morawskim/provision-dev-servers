class sensi::provision_repo (
    String $repo_url
) {

  package { 'git':
    ensure => present
  }

  vcsrepo { '/root/provision':
    ensure   => present,
    provider => git,
    source   => $repo_url,
    require => Package['git']
  }
}
