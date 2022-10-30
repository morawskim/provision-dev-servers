## Sentry

The terraform configuration will add all necesary projects, team(s) and alerts to Sentry.
You need an auth token, which can be generated in Sentry.

Go to Sentry. From left menu click on "Settings".
Then from secondary menu click on "Developer Settings" and click "Create a new integration".
Chose "Internal Integration".
You should set following permissions:

| Scope  | Permission  |
|---|---|
| Project  | Read & Write  |
| Team  | Read & Write  |
| Release   | No Access  |
| Issue & Event| No Access |
| Organization | Read |
| Member | No Access |

You can call `SENTRY_AUTH_TOKEN=you_generated_token terraform apply`

### Project platform

When you have already a project you can see project platform from request sent from Sentry panel (https://sentry.io/organizations/<org-slug>/projects/) to endpoint `/api/0/organizations/<org-slug>/projects/?all_projects=1&collapse=latestDeploys`.
The response will be array of projects and the project will have a key `platform`. You can use this value, when you create a new project in Sentry via terraform.
