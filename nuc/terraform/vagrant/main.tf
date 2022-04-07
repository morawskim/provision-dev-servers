terraform {
  required_version = ">= 0.13"
  required_providers {
    libvirt = {
      source = "github.com/dmacvicar/libvirt"
      version = "0.6.3"
    }
  }
}

provider "libvirt" {
  uri   = "qemu+ssh://vagrant@leap.local/system"
}

module "network" {
  source    = "../modules/network"
  subnet = "192.168.120.0/24"
}

module "vm-docker" {
  source    = "../modules/vm"
  name = "docker"
  network_id = module.network.id
}

module "vm-gitlab" {
  source    = "../modules/vm"
  name = "gitlab"
  disk = 1024*1024*1024*10 # 10 GB
  network_id = module.network.id
}
