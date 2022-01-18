resource "libvirt_cloudinit_disk" "commoninit-gitlab" {
  name = "commoninit-gitlab.iso"
  user_data      = data.template_file.user_data.rendered
}

resource "libvirt_volume" "ubuntu-lts-20-gitlab" {
  name = "ubuntu-lts-20-gitlab.qcow2"
  pool = "default"
  source = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
  format = "qcow2"
}

resource "libvirt_volume" "vm-gitlab-runner" {
  name           = "disk"
  base_volume_id = libvirt_volume.ubuntu-lts-20-gitlab.id
  pool           = "default"
  size           = 1024*1024*1024*80 # 80 GB
}

resource "libvirt_domain" "vm-ubuntu-gitlab-runner" {
  name   = "vm-ubuntu-gitlab-runner"
  memory = "6000"
  vcpu   = 3
  autostart = true
  cloudinit = libvirt_cloudinit_disk.commoninit-gitlab.id

  network_interface {
    network_id = libvirt_network.internal.id
    addresses  = ["192.168.111.20"]
  }

  disk {
    volume_id = libvirt_volume.vm-gitlab-runner.id
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
