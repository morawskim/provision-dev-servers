terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" {
    # whereis opensc-pkcs11.so
    # ssh-add -s /usr/lib/x86_64-linux-gnu/opensc-pkcs11.so
    # ssh-add -l
    uri   = "qemu+sshcmd://marcin@192.168.33.110/system?sshauth=agent,privkey"
}

locals {
  pool_name    = "storage"
  netowrk_name = "bridge"
}

data "libvirt_node_info" "host" {
}

output "host_memory_gb" {
  description = "Total host memory in GB"
  value       = data.libvirt_node_info.host.memory_total_kb / 1024 / 1024
}
