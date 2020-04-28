class sensi::kvm {

  package {['qemu-kvm', 'libvirt-bin', 'virt-top', 'libguestfs-tools', 'virtinst', 'bridge-utils']:
    ensure  => present,
  }

  service {'libvirtd':
    ensure  => running,
    enable  => true,
    require => Package['qemu-kvm']
  }
}
