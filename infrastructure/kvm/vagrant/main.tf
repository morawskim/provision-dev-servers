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
  ssh_keys = [
    "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBMLzZA7DQH1lfdA8ZB4HiuD4SMes11rdotJIfR9Pjeq0qMdOVisIlLbV7kr4sOfTWNFcPzKQhtIB4MLFuDp6X+E= PIV AUTH pubkey",
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC+pD+ryCRaVx76r1HYgZH9atGBEQ6ZgOWVfHGsvmHu4ZZLHZeLmuyqxmTSx3DwPappxRs25R88jY9ixw4IAfUWt1Z3tddDvE9cKdQU5INCV78eckX1K7zgniXK8OnXP9B05FKGEJ071pnmfmTBUCuRDhEw8ToIAvUI81fBjTipFloZNuJ7aJ45kEIdDKLXRI7X2UXjXcIRtku1Texluv1aE2fG5TSUgMPxuF8kHHiJOyK7CMkndElS4hHAJQNCwOQZ+q09qHHKtana5KNTfPy1OJpF2/hc382533/bu3oXG13gU9im4Q97139ikpOrKpiMivgClfLmaK4s1k3sr9oe9KTe5JR5m55RLtmksUcb/fHuw4/IF9mMTo2qy4BYCVQ+UnkQzBF6EIeYNUuWE1rJm8aZs/t4N+Mqpbll1ET6bbexma8Lqzh8lis4OjhHPxcTE+9rvuU/3Ib5WArqOdkwUqSRQCGaUHcaJe0L/Or2gH00kRocMUs7uMugGaoBMic= vagrant"
  ]
}

module "vm-gitlab" {
  source    = "../modules/vm"
  name = "gitlab"
  disk = 1024*1024*1024*10 # 10 GB
  network_id = module.network.id
  distribution = "ubuntu-22-lts"
  ssh_keys = [
    "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBMLzZA7DQH1lfdA8ZB4HiuD4SMes11rdotJIfR9Pjeq0qMdOVisIlLbV7kr4sOfTWNFcPzKQhtIB4MLFuDp6X+E= PIV AUTH pubkey",
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC+pD+ryCRaVx76r1HYgZH9atGBEQ6ZgOWVfHGsvmHu4ZZLHZeLmuyqxmTSx3DwPappxRs25R88jY9ixw4IAfUWt1Z3tddDvE9cKdQU5INCV78eckX1K7zgniXK8OnXP9B05FKGEJ071pnmfmTBUCuRDhEw8ToIAvUI81fBjTipFloZNuJ7aJ45kEIdDKLXRI7X2UXjXcIRtku1Texluv1aE2fG5TSUgMPxuF8kHHiJOyK7CMkndElS4hHAJQNCwOQZ+q09qHHKtana5KNTfPy1OJpF2/hc382533/bu3oXG13gU9im4Q97139ikpOrKpiMivgClfLmaK4s1k3sr9oe9KTe5JR5m55RLtmksUcb/fHuw4/IF9mMTo2qy4BYCVQ+UnkQzBF6EIeYNUuWE1rJm8aZs/t4N+Mqpbll1ET6bbexma8Lqzh8lis4OjhHPxcTE+9rvuU/3Ib5WArqOdkwUqSRQCGaUHcaJe0L/Or2gH00kRocMUs7uMugGaoBMic= vagrant"
  ]
}
