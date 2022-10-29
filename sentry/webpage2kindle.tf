resource "sentry_project" "webpage2kindle" {
  organization = sentry_team.main.organization
  team         = sentry_team.main.id
  name         = "webpage2kindle"
  platform     = "php-symfony"
}

resource "sentry_issue_alert" "webpage2kindle" {
  organization = sentry_project.webpage2kindle.organization
  project      = sentry_project.webpage2kindle.id
  name         = "A new issue or transition resolved => unresolved"

  action_match = "any"
  filter_match = "none"
  frequency    = 30

  conditions = local.default_alert_conditions

  filters = []

  actions = local.default_alert_actions
}
