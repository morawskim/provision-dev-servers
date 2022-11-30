resource "aws_resourcegroups_group" "backup" {
  name = "Backup"

  resource_query {
    query = <<JSON
{
  "ResourceTypeFilters": ["AWS::AllSupported"],
  "TagFilters": [
    {
      "Key": "Project",
      "Values": ["backup"]
    }
  ]
}
JSON
  }
  tags = {
    Project = "core"
  }
}

resource "aws_resourcegroups_group" "router" {
  name = "Router"

  resource_query {
    query = <<JSON
{
  "ResourceTypeFilters": ["AWS::AllSupported"],
  "TagFilters": [
    {
      "Key": "Project",
      "Values": ["router"]
    }
  ]
}
JSON
  }
  tags = {
    Project = "core"
  }
}
