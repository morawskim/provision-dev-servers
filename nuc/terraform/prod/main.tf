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
  uri   = "qemu+ssh://marcin@intel.morawskim.pl/system"
}

module "network" {
  source    = "../modules/network"
  subnet = "192.168.111.0/24"
}

module "vm-docker" {
  source    = "../modules/vm"
  name = "docker"
  disk = 1024*1024*1024*60 # 60 GB
  memory = 2560
  vcpu   = 3
  network_id = module.network.id
}

module "vm-gitlab" {
  source    = "../modules/vm"
  name = "gitlab"
  disk = 1024*1024*1024*80 # 80 GB
  memory = 5000
  vcpu   = 3
  network_id = module.network.id
}
