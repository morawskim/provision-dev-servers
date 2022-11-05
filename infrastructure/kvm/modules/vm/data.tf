data "template_file" "network_config" {
  template = file("${path.module}/network_config.cfg")
}
