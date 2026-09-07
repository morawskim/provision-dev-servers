# Create boot disk for openmedia
resource "libvirt_volume" "openmediavault_disk" {
  name = "vm1-disk.qcow2"
  pool = local.pool_name
  target = {
    format = {
      type = "qcow2"
    }
  }

  capacity = 21474836480 # 20GB in bytes
}

resource "libvirt_volume" "openmediavault_data" {
  name = "openmediavault_data.qcow2"
  pool = local.pool_name
  target = {
    format = {
      type = "qcow2"
    }
  }

  capacity = 21474836480 # 20GB in bytes
}


resource "libvirt_domain" "openmedia" {
  name        = "openmedia"
  memory      = 1536
  memory_unit = "MiB"
  vcpu        = 1
  autostart   = true
  running     = true
  type        = "kvm"

  os = {
    type         = "hvm"
    type_arch    = "x86_64"
    type_machine = "q35"
    boot_devices = [
      {
        dev = "hd"
      },
      {
        dev = "cdrom"
      }
    ]
    # kernel_args  = "console=ttyS0 root=/dev/vda1"
  }

  devices = {
    disks = [
      # Main system disk
      {
        source = {
          volume = {
            pool   = libvirt_volume.openmediavault_disk.pool
            volume = libvirt_volume.openmediavault_disk.name
          }
        }
        target = {
          bus = "virtio"
          dev = "vda"
        }
        driver = {
          type = "qcow2"
        }
      },
      # disk for data
      {
        source = {
          volume = {
            pool   = libvirt_volume.openmediavault_data.pool
            volume = libvirt_volume.openmediavault_data.name
          }
        }
        target = {
          bus = "virtio"
          dev = "vdb"
        }
        driver = {
          type = "qcow2"
        }
      },
      #       {
      #         source = {
      #           block = {
      #             dev = "/dev/disk/by-id/wwn-0x5000cca123456789"
      #           }
      #         }
      #
      #         target = {
      #           dev = "vdb"
      #           bus = "virtio"
      #         }
      #       },

      # iso to install
      {
        device = "cdrom"
        source = {
          volume = {
            pool   = "storage"
            volume = "openmediavault8_3.iso"
          }
        }
        target = {
          bus = "sata"
          dev = "sda"
        }
      }
    ]
    interfaces = [
      {
        model = {
          type = "virtio"
        }
        source = {
          network = {
            network = local.netowrk_name
          }
        }
      }
    ]
    consoles = [
      {
        type        = "pty"
        target_port = "0"
        target_type = "serial"
      }
    ]

    # Graphics console (VNC)
    graphics = [
      {
        vnc = {
          auto_port = true
          listen    = "127.0.0.1"
        }
      }
    ]
  }
}
