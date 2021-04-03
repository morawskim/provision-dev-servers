terraform {
 required_version = ">= 0.13"
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.6.3"
    }
  }
}

provider "libvirt" {
  uri   = "qemu+ssh://marcin@192.168.0.50/system"
}

resource "libvirt_volume" "ubuntu-lts-20" {
  name = "ubuntu-lts-20.qcow2"
  pool = "default"
  source = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
  format = "qcow2"
}

resource "libvirt_network" "internal" {
  # the name used by libvirt
  name = "internal"

  # mode can be: "nat" (default), "none", "route", "bridge"
  mode = "route"

  #  list of subnets the addresses allowed for domains connected
  addresses = ["192.168.101.0/24"]

  autostart = true

  dns {
    enabled = true
  }
}

### docker-vm: increase ubuntu images
### docker-vm: Use CloudInit
resource "libvirt_volume" "vm-docker" {
  name           = "disk"
  base_volume_id = libvirt_volume.ubuntu-lts-20.id
  pool           = "default"
  size           = 1024*1024*1024*20 # 20 GB
}

data "template_file" "user_data" {
  template = file("${path.module}/cloud_init.cfg")
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name = "commoninit-docker.iso"
  user_data      = data.template_file.user_data.rendered
}

resource "libvirt_domain" "vm-docker" {
  name   = "vm-docker"
  memory = "3072"
  vcpu   = 2
  autostart = true
  cloudinit = libvirt_cloudinit_disk.commoninit.id

  network_interface {
    network_id = libvirt_network.internal.id
    addresses  = ["192.168.101.10"]
  }

  disk {
    volume_id = libvirt_volume.vm-docker.id
  }

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }
}
