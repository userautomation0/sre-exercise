data "aws_iam_policy_document" "allow_read_from_owner_root" {
  statement {
    sid = "allow_read_from_owner_root"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }

    actions = [
      "s3:*",
    ]

    resources = [
      "arn:aws:s3:::${aws_s3_bucket.this.id}/*",
      "arn:aws:s3:::${aws_s3_bucket.this.id}",
    ]
  }
}

data "aws_iam_policy_document" "allow_secure_only" {
  statement {
    sid    = "allow_secure_only"
    effect = "Deny"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:*",
    ]

    resources = [
      "arn:aws:s3:::${aws_s3_bucket.this.id}/*",
      "arn:aws:s3:::${aws_s3_bucket.this.id}",
    ]

    condition {
      test     = "Bool"
      values   = ["false"]
      variable = "aws:SecureTransport"
    }
  }
}

data "aws_iam_policy_document" "combined" {

  source_policy_documents = compact([
    var.allow_bucket_policy ? var.bucket_policy : "",
    var.allow_root ? data.aws_iam_policy_document.allow_read_from_owner_root.json : "",
    var.allow_secure_only ? data.aws_iam_policy_document.allow_secure_only.json : "",
    ])
}
