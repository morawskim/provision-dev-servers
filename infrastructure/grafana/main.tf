terraform {
  required_providers {
    grafana = {
      source = "grafana/grafana"
      version = "1.31.1"
    }
  }
}

provider "grafana" {
  url  = "https://morawskim.grafana.net"
}

resource "grafana_folder" "projects" {
  title = "Projects"
}
