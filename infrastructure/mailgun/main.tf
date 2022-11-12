terraform {
  required_providers {
    mailgun = {
      source = "wgebis/mailgun"
      version = "0.7.2"
    }
  }
}

provider "mailgun" {
  api_key = "${var.mailgun_api_key}"
}

variable "mailgun_api_key" {
  type = string
  description = "Mailgun API key"
}
