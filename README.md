Example terraform module to show how to work with custom lifecycle configuration

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| acl | The canned ACL. Details: https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl | string | `"private"` | no |
| encryption\_config | A configuration of server side encryption. Details: http://docs.aws.amazon.com/AmazonS3/latest/dev/bucket-encryption.html | list | `<list>` | no |
| lifecycle\_rules | A configuration of lifecycle rules. Details: http://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html | list | `<list>` | no |
| name | The name of the bucket, random by default | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the bucket |
| id | The name of the bucket |
| uri | The URI of the bucket, ex. s3://<bucket_name> |

