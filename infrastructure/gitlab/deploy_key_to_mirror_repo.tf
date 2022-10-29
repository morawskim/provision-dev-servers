resource "gitlab_deploy_key" "mirror_repo" {
  for_each = local.repos_to_add_mirror_deployment_key
  project  = each.key
  title    = "git-mirror-tf"
  key      = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFtv+LKtZFiqTnloLfZdLm+O61IIRVzlOo25B6MsmMqG git-mirror"
  can_push = true
}
