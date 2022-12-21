data "local_file" "gpg_key_to_sign_rpm_packages" {
    filename = "${path.module}/ci.key"
}

resource "gitlab_project_variable" "example" {
  project   = "morawskim/rpm-pipeline"
  key       = "GPG_PRIVATE_KEY_TO_SIGN"
  value     = data.local_file.gpg_key_to_sign_rpm_packages.content
  protected = false
  variable_type = "file"
}
