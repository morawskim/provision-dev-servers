resource "libvirt_network" "internal" {
  # the name used by libvirt
  name = "internal-nat"

  # mode can be: "nat" (default), "none", "route", "bridge"
  mode = "nat"

  #  list of subnets the addresses allowed for domains connected
  addresses = ["192.168.111.0/24"]

  autostart = true

  dns {
    enabled = true
  }
}
