# S3 Buckets
resource "aws_s3_bucket" "paulynomial" {
  bucket = "paulynomial"
  acl    = "private"

  tags = {
    Name        = "General paulynomial things"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "paulynomial_longhorn" {
  bucket = "paulynomial-longhorn-backups"
  acl    = "private"

  tags = {
    Name        = "K8S Longhorn FS Backups"
    Environment = "Dev"
  }
}

# IAM Users + Policies
resource "aws_iam_user" "longhorn" {
  name = "longhorn"
  path = "/system/"

  tags = {
    env  = "system"
    role = "storage"
  }
}

resource "aws_iam_access_key" "longhorn" {
  user = aws_iam_user.longhorn.name
}

data "aws_iam_policy_document" "longhorn_rw_s3" {
  statement {
    sid    = "GrantLonghornBackupstoreAccess"
    effect = "Allow"

    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:ListBucket",
      "s3:DeleteObject"
    ]

    resources = [
      aws_s3_bucket.paulynomial_longhorn.arn,
      "${aws_s3_bucket.paulynomial_longhorn.arn}/*"
    ]
  }

}

resource "aws_iam_user_policy" "longhorn_rw_s3" {
  name   = "longhorn-rw-s3"
  user   = aws_iam_user.longhorn.name
  policy = data.aws_iam_policy_document.longhorn_rw_s3.json
}
