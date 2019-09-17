/**
 * Example terraform module to show how to work with custom lifecycle/encyrption configuration
 *
 */

resource "random_string" "name" {
  length  = 16
  special = false
  number  = true
  upper   = false
}

resource "aws_s3_bucket" "this" {
  bucket                               = "${coalesce(var.name,random_string.name.result)}"
  acl                                  = "${var.acl}"
  lifecycle_rule                       = "${var.lifecycle_rules}"
  server_side_encryption_configuration = "${var.encryption_config}"
}
