terraform {
  required_providers {
    cloudamqp = {
      source = "cloudamqp/cloudamqp"
      version = "1.27.0"
    }
  }
}

provider "cloudamqp" {
  # use env variable CLOUDAMQP_APIKEY
  #apikey          = var.cloudamqp_api_key
}
