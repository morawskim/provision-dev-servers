variable "name" {
  type = string
}

variable "network_id" {
  type = string
}

variable "ips" {
  type = list(string)
}

variable "vcpu" {
  type = number
  default = 1
}

variable "memory" {
  type = number
  default = 1024
}

variable "disk" {
  type = number
  default = 1024*1024*1024*20 # 20 GB
}
