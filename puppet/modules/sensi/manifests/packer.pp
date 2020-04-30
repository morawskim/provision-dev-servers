class sensi::packer {
  $version = '1.4.5'

  archive { "/tmp/packer-${version}.zip":
    ensure        => present,
    extract       => true,
    extract_path  => '/tmp/',
    source        => "https://releases.hashicorp.com/packer/${version}/packer_${version}_linux_amd64.zip",
    checksum      => '30da8dab9c526a6d15b037e2234f6f12cf3accfad77eb2c130738ec1a54cab6d',
    checksum_type => 'sha256',
    creates       => '/usr/bin/packer',
    cleanup       => true,
  } -> file { '/usr/bin/packer':
    ensure         => present,
    source         => '/tmp/packer',
    checksum       => 'sha256',
    checksum_value => '3f2c53501ae8149bf27bbcefe61580241e826977445855fc736851fec143259d',
    owner          => 'root',
    group          => 'root',
    mode           => '0755'
  }
}
