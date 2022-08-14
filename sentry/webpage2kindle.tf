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

  conditions = [
    {
      id   = "sentry.rules.conditions.first_seen_event.FirstSeenEventCondition"
      name = "A new issue is created"
    },
    {
      id   = "sentry.rules.conditions.regression_event.RegressionEventCondition"
      name = "The issue changes state from resolved to unresolved"
    },
  ]

  filters = []

  actions = [
    {
      id               = "sentry.mail.actions.NotifyEmailAction"
      name             = "Send a notification to Team"
      targetType       = "Team"
      targetIdentifier = sentry_team.main.team_id
    },
  ]
}
