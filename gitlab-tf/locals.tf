locals {
  nuc_shell_ubuntu_20_lts  = 12392961
  nuc_docker_ubuntu_20_lts = 12392960

  projects_for_nuc_docker_ubuntu_20_lts = toset([
    "morawskim/test-tf-gitlab",
    "morawskim/ssorder",
    "morawskim/packtpub-free-learning",
    "morawskim/faker-cli",
    "morawskim/ssorder-deploy",
  ])
  projects_for_nuc_shell_ubuntu_20_lts = toset([
    "morawskim/packer-images",
    "morawskim/ssorder-deploy",
  ])
}
