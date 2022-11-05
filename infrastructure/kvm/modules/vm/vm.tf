resource "libvirt_cloudinit_disk" "commoninit" {
  name = "commoninit-ubuntu-${var.name}.iso"
  user_data  = templatefile("${path.module}/cloud_init.cfg", {
    ssh_keys = var.ssh_keys
  })
  network_config = data.template_file.network_config.rendered
}

resource "libvirt_volume" "ubuntu-lts-20" {
  name = "ubuntu-lts-20-${var.name}.qcow2"
  pool = "default"
  source = local.distribution_map[var.distribution].iso
  format = "qcow2"
}

### docker-vm: increase ubuntu images
### docker-vm: Use CloudInit
resource "libvirt_volume" "vm-disk" {
  name           = "disk-vm-${var.name}"
  base_volume_id = libvirt_volume.ubuntu-lts-20.id
  pool           = "default"
  size           = var.disk
}

resource "libvirt_domain" "vm-ubuntu" {
  name   = "vm-ubuntu-${var.name}"
  memory = var.memory
  vcpu   = var.vcpu
  autostart = true
  cloudinit = libvirt_cloudinit_disk.commoninit.id

  network_interface {
    network_id = var.network_id
    hostname = var.name
    wait_for_lease = true
    addresses = []
  }

  disk {
    volume_id = libvirt_volume.vm-disk.id
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

  lifecycle {
    ignore_changes = [ network_interface["addresses"] ]
  }
}
