variable "name" {
  type = string
}

variable "network_id" {
  type = string
}

variable "ssh_keys" {
  type    = list(string)
}

variable "distribution" {
  type    = string
  default = "ubuntu-20-lts"

  validation {
    condition     = contains(["ubuntu-20-lts", "ubuntu-22-lts"], var.distribution)
    error_message = "Allowed values for distribution are \"ubuntu-20-lts\" or \"ubuntu-22-lts\"."
  }
}

variable "vcpu" {
  type = number
  default = 1
}

variable "cpu_mode" {
  type = string
  default = "qemu64"
}

variable "memory" {
  type = number
  default = 1024
}

variable "disk" {
  type = number
  default = 1024*1024*1024*20 # 20 GB
}
