module "encpyrted_bucket_with_lifecycle" {
  source = "../../terraform-aws-s3-bucket"

  # use random name
  name = ""

  encryption_config = [{
    rule = [
      {
        apply_server_side_encryption_by_default = [
          {
            sse_algorithm = "AES256"
          },
        ]
      },
    ]
  }]

  lifecycle_rules = [{
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

module "unencrypted_bucket" {
  source = "../../terraform-aws-s3-bucket"

  name              = "my-unencrypted-bucket"
  encryption_config = []
  lifecycle_rules   = []
}
