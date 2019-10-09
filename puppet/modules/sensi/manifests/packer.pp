class sensi::packer {
  $version = '1.4.3'

  archive { "/tmp/packer-${version}.zip":
    ensure        => present,
    extract       => true,
    extract_path  => '/tmp/',
    source        => "https://releases.hashicorp.com/packer/${version}/packer_${version}_linux_amd64.zip",
    checksum      => 'c89367c7ccb50ca3fa10129bbbe89273fba0fa6a75b44e07692a32f92b1cbf55',
    checksum_type => 'sha256',
    creates       => '/usr/bin/packer',
    cleanup       => true,
  } -> file { '/usr/bin/packer':
    ensure         => present,
    source         => '/tmp/packer',
    checksum       => 'sha256',
    checksum_value => '57e618e4d3fafb152a44d37f208f4e89c7a36e52ce279916fe04b26599fa60f9',
    owner          => 'root',
    group          => 'root',
    mode           => '0755'
  }
}
