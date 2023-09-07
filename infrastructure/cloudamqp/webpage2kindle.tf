# Create a new cloudamqp instance
resource "cloudamqp_instance" "instance" {
  name          = "webpage2kindle"
  plan          = "lemur"
  region        = "amazon-web-services::eu-central-1"
  tags          = [ "webpage2kindle" ]
}
