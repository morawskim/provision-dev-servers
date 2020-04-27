class sensi::linux_headers {
  package {"linux-headers-${::kernelrelease}":
    ensure  => present,
  }
}
