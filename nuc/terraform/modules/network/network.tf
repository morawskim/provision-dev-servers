resource "libvirt_network" "internal" {
  # the name used by libvirt
  name = "internal-nat"

  # mode can be: "nat" (default), "none", "route", "bridge"
  mode = "nat"

  #  the domain used by the DNS server in this network
  domain = "pck.internal"

  #  list of subnets the addresses allowed for domains connected
  addresses = [var.subnet]

  autostart = true

  dns {
    enabled = true
  }
}
