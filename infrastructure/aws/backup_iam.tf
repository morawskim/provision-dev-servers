resource "aws_iam_role" "backup" {
  name = "backup_role"
  tags = {
    Project = "backup"
  }
  max_session_duration = 14400

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${local.account_id}:user/backup"
        }
      },
    ]
  })

  inline_policy {
    name = "s3_policy"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action   = [
            "s3:PutObject",
            "s3:GetObject",
            "s3:ListBucketMultipartUploads",
            "s3:AbortMultipartUpload",
            "s3:DeleteObject",
            "s3:ListMultipartUploadParts",
            "s3:ListObjectsV2",
            "s3:ListObjects",
            "s3:HeadBucket",
          ]
          Effect   = "Allow"
          Resource = ["${aws_s3_bucket.backup.arn}/*"]
        },
        {
          Action   = [
            "s3:ListBucket",
            "s3:HeadBucket",
          ]
          Effect   = "Allow"
          Resource = ["${aws_s3_bucket.backup.arn}"]
        },
      ]
    })
  }
}

resource "aws_iam_user" "backup" {
  name = "backup"
  path = "/"
  tags = {
    Project = "backup"
  }
}

#resource "aws_iam_access_key" "backup" {
#  user = aws_iam_user.backup.name
#}

output "backup_role" {
  description = "IAM backup role"
  value       = aws_iam_role.backup.arn
}
