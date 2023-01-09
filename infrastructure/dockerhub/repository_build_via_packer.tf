resource "dockerhub_repository" "opensuse_leap_kde5_devel" {
  name        = "opensuse-leap-kde5-devel"
  namespace   = "morawskim"
  description = "KDE development environment in docker for opensuse leap"
  full_description = ""
}

resource "dockerhub_repository" "opensuse_leap_kde5" {
  name        = "opensuse-leap-kde5"
  namespace   = "morawskim"
  description = "KDE environment in docker for opensuse leap"
  full_description = ""
}
