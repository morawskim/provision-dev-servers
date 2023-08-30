terraform {
  required_providers {
    grafana = {
      source = "grafana/grafana"
      version = "1.31.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "grafana" {
  url  = "https://morawskim.grafana.net"
}

provider "aws" {
  region = "eu-central-1"
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
