resource "aws_s3_bucket" "backup" {
  bucket = "mmo-backup-server"
}

output "s3_bucket" {
  description = "S3 backup bucket"
  value       = aws_s3_bucket.backup.arn
}
