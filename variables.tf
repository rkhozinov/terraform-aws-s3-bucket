variable "lifecycle_rules" {
  description = "A configuration of lifecycle rules. Details: http://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html"

  default = [
    {
      id      = "log"
      enabled = true
      prefix  = "log/"

      tags = {
        "rule"      = "log"
        "autoclean" = "true"
      }

      transition = [
        {
          days          = 30
          storage_class = "STANDARD_IA" # or "ONEZONE_IA"
        },
        {
          days          = 60
          storage_class = "GLACIER"
        },
      ]

      expiration = [
        {
          days = 90
        },
      ]
    },
    {
      id      = "tmp"
      prefix  = "tmp/"
      enabled = true

      expiration = [
        {
          date = "2016-01-12"
        },
      ]
    },
  ]
}

variable "encryption_config" {
  type = "list"

  description = "A configuration of server side encryption. Details: http://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html"

  default = [
    {
      rule = [
        {
          apply_server_side_encryption_by_default = [
            {
              sse_algorithm = "AES256"
            },
          ]
        },
      ]
    },
  ]
}

variable "name" {
  default     = ""
  description = "The name of the bucket, random by default"
}

variable "acl" {
  default     = "private"
  description = "The canned ACL. Details: https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl"
}
