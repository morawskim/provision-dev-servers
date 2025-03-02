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
  uri   = "qemu+ssh://root@intel.morawskim.pl/system"
}

module "network" {
  source    = "../modules/network"
  subnet = "192.168.111.0/24"
}

module "vm-gitlab" {
  source    = "../modules/vm"
  name = "gitlab"
  disk = 1024*1024*1024*80 # 80 GB
  memory = 4800
  vcpu   = 3
  cpu_mode = "host-passthrough"
  network_id = module.network.id
  distribution = "ubuntu-22-lts"
  ssh_keys = [
    "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBMLzZA7DQH1lfdA8ZB4HiuD4SMes11rdotJIfR9Pjeq0qMdOVisIlLbV7kr4sOfTWNFcPzKQhtIB4MLFuDp6X+E= PIV AUTH pubkey"
  ]
}

module "vm-k8s" {
  source    = "../modules/vm"
  name = "k8s"
  disk = 1024*1024*1024*80 # 60 GB
  memory = 2800
  vcpu   = 3
  cpu_mode = "host-passthrough"
  network_id = module.network.id
  distribution = "ubuntu-22-lts"
  ssh_keys = [
    "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBMLzZA7DQH1lfdA8ZB4HiuD4SMes11rdotJIfR9Pjeq0qMdOVisIlLbV7kr4sOfTWNFcPzKQhtIB4MLFuDp6X+E= PIV AUTH pubkey"
  ]
}
