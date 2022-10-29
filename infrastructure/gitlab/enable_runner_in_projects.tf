resource "gitlab_project_runner_enablement" "nuc_docker_ubuntu_20_lts" {
  for_each = local.projects_for_nuc_docker_ubuntu_20_lts
  project   = each.key
  runner_id = local.nuc_docker_ubuntu_20_lts
}

resource "gitlab_project_runner_enablement" "nuc_shell_ubuntu_20_lts" {
  for_each = local.projects_for_nuc_shell_ubuntu_20_lts
  project   = each.key
  runner_id = local.nuc_shell_ubuntu_20_lts
}
