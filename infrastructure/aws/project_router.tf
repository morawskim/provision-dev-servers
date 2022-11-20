resource "aws_cloudwatch_log_group" "router" {
  name              = "/application/router"
  retention_in_days = 7
  tags = {
    Project = "router"
  }
}

resource "aws_iam_policy" "cloudwatch_router" {
  name        = "cloudwatch_router"
  path        = "/"
  description = "Cloudwatch policy for router log group"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
        {
            Sid = "EnableCreationAndManagementOfCloudwatchLogEvents",
            Effect = "Allow",
            Action = [
                "logs:GetLogEvents",
                "logs:PutLogEvents"
            ],
            Resource = [
                "${aws_cloudwatch_log_group.router.arn}:log-stream:*",
                "${aws_cloudwatch_log_group.router.arn}/*:log-stream:*",
            ]
        },
        {
            "Sid" = "EnableCreationAndManagementOfCloudwatchLogGroupsAndStreams",
            "Effect" = "Allow",
            "Action" = [
                "logs:CreateLogStream",
                "logs:DescribeLogStreams",
                "logs:PutRetentionPolicy",
                "logs:CreateLogGroup"
            ],
            "Resource" = [
                "${aws_cloudwatch_log_group.router.arn}",
                "${aws_cloudwatch_log_group.router.arn}:log-stream:*",
                "${aws_cloudwatch_log_group.router.arn}/*",
                "${aws_cloudwatch_log_group.router.arn}/*:log-stream:*",
            ]
        }
    ]
  })

  tags = {
    Project = "router"
  }
}

resource "aws_iam_user" "router" {
  name = "router"
  path = "/application/"

  tags = {
    Project = "router"
  }
}

resource "aws_iam_user_policy_attachment" "router_cloudwatch" {
  user       = aws_iam_user.router.name
  policy_arn = aws_iam_policy.cloudwatch_router.arn
}
