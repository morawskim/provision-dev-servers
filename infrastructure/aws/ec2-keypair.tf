resource "aws_key_pair" "marcin_lenovo" {
  key_name   = "marcin-lenovo"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA+RFkF97xrhZjRw9H4MtNrfv63iFa1XynEZLtqvclwU marcin-aws-lenovo"
}
resource "aws_key_pair" "marcin_hp" {
  key_name   = "marcin-hp"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIg9bWbPYwm/BMsxo0v35Oxhk5eAJu8Okt5gK+BAIQQc marcin-aws-hp"
}
