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

locals {
  prometheus_uid = "grafanacloud-prom"
}

resource "grafana_folder" "projects" {
  title = "Projects"
}

resource "grafana_folder" "saas" {
  title = "SaaS"
}
