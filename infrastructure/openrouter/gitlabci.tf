resource "openrouter_workspace" "gitlab" {
  name                             = "GitLab Runner"
  slug                             = "gitlab"
  description                      = "GitLab workspace"
  default_text_model               = "openai/gpt-5.1-codex"
  default_provider_sort            = "price"
  io_logging_sampling_rate         = 1
  is_data_discount_logging_enabled = true
}

resource "openrouter_api_key" "gitlab" {
  name                  = "gitlab-key"
  workspace_id          = openrouter_workspace.gitlab.id
  limit                 = 2
  limit_reset           = "monthly"
  include_byok_in_limit = true
}

output "gitlab_key" {
  description = "API key for GitLab workspace"
  value       = openrouter_api_key.gitlab.key
  sensitive   = true
}
