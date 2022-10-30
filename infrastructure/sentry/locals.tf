locals {
  default_alert_conditions = [
    {
      id   = "sentry.rules.conditions.first_seen_event.FirstSeenEventCondition"
      name = "A new issue is created"
    },
    {
      id   = "sentry.rules.conditions.regression_event.RegressionEventCondition"
      name = "The issue changes state from resolved to unresolved"
    },
  ]
  default_alert_actions = [
    {
      id               = "sentry.mail.actions.NotifyEmailAction"
      name             = "Send a notification to Team"
      targetType       = "Team"
      targetIdentifier = sentry_team.main.team_id
    },
  ]
}
