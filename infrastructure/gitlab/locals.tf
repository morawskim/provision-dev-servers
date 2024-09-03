locals {
  nuc_shell_ubuntu_20_lts  = 12392961
  nuc_docker_ubuntu_20_lts = 12392960

  projects_for_nuc_docker_ubuntu_20_lts = toset([
    "morawskim/test-tf-gitlab",
    "morawskim/ssorder",
    "morawskim/packtpub-free-learning",
    "morawskim/faker-cli",
    "morawskim/ssorder-deploy",
    "morawskim/webpage2kindle",
    "morawskim/rpm-pipeline",
    "morawskim/sync-docker-images",
    "morawskim/mirror-git-repositories",
  ])
  projects_for_nuc_shell_ubuntu_20_lts = toset([
    "morawskim/packer-images",
    "morawskim/ssorder-deploy",
  ])

  repos_to_add_mirror_deployment_key = toset([
    "morawskim/ssorder",
    "morawskim/packtpub-free-learning",
    "morawskim/packer-images",
    "morawskim/faker-cli",
    "morawskim/webpage2kindle",
    "morawskim/sync-docker-images",
    "morawskim/up-to-date-exporter",
    "morawskim/rpm-pipeline"
  ])
}
