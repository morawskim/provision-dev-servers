resource "aws_s3_bucket" "backup" {
  bucket = "mmo-backup-server"
  tags = {
    Project = "backup"
  }
}

output "s3_bucket" {
  description = "S3 backup bucket"
  value       = aws_s3_bucket.backup.arn
}
