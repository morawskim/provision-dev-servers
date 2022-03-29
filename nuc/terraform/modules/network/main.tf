terraform {
  required_version = ">= 0.13"
  required_providers {
    libvirt = {
      source = "github.com/dmacvicar/libvirt"
      version = "0.6.3"
    }
  }
}
