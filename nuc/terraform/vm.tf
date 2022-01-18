resource "libvirt_cloudinit_disk" "commoninit-docker" {
  name = "commoninit-ubuntu-docker.iso"
  user_data      = data.template_file.user_data.rendered
}

resource "libvirt_volume" "ubuntu-lts-20-docker" {
  name = "ubuntu-lts-20-docker.qcow2"
  pool = "default"
  source = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
  format = "qcow2"
}

### docker-vm: increase ubuntu images
### docker-vm: Use CloudInit
resource "libvirt_volume" "vm-docker" {
  name           = "disk-vm-docker"
  base_volume_id = libvirt_volume.ubuntu-lts-20-docker.id
  pool           = "default"
  size           = 1024*1024*1024*20 # 20 GB
}

resource "libvirt_domain" "vm-ubuntu-docker" {
  name   = "vm-ubuntu-docker"
  memory = "1500"
  vcpu   = 2
  autostart = true
  cloudinit = libvirt_cloudinit_disk.commoninit-docker.id

  network_interface {
    network_id = libvirt_network.internal.id
    addresses  = ["192.168.111.10"]
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
