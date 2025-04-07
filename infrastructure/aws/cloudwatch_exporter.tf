resource "aws_iam_policy" "cloudwatch_exporter" {
  name        = "cloudwatch_exporter"
  path        = "/"
  description = "Cloudwatch policy for cloudwatch_exporter"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
        {
            Sid = "cloudwatch",
            Effect = "Allow",
            Action = [
                "cloudwatch:ListMetrics",
                "cloudwatch:GetMetricStatistics",
                "cloudwatch:GetMetricData",
                "tag:GetResources"
            ],
            Resource = ["*"]
        }
    ]
  })

  tags = {
    Project = "cloudwatch_exporter"
  }
}

resource "aws_iam_user" "cloudwatch_exporter" {
  name = "cloudwatch_exporter"
  path = "/application/"

  tags = {
    Project = "cloudwatch_exporter"
  }
}

resource "aws_iam_user_policy_attachment" "cloudwatch_exporter_cloudwatch" {
  user       = aws_iam_user.cloudwatch_exporter.name
  policy_arn = aws_iam_policy.cloudwatch_exporter.arn
}
