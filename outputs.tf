output "id" {
  description = "The name of the bucket"
  value       = "${aws_s3_bucket.this.id}"
}

output "arn" {
  description = "The ARN of the bucket"
  value       = "${aws_s3_bucket.this.arn}"
}

output "uri" {
  description = "The URI of the bucket, ex. s3://<bucket_name>"
  value       = "s3://${aws_s3_bucket.this.id}"
}
