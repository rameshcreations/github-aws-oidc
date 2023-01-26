#Identity Provider
resource "aws_iam_openid_connect_provider" "this" {
  url = "https://token.actions.githubusercontent.com"
  client_id_list = [
    "sts.amazonaws.com",
  ]
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"]
}

#IAM Role for Github
resource "aws_iam_role" "this" {
  name               = format("%s-%s", local.name, "github-oidc")
  assume_role_policy = data.aws_iam_policy_document.github.json
}

#IAM Role Policy attachment
resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# S3 Bucket for terraform Backend
module "s3_backend" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.6.1"

  bucket = local.name
  acl    = "private"

  versioning = {
    enabled = true
  }
}

# Terraform State Lock
module "dynamodb_table" {
  source  = "terraform-aws-modules/dynamodb-table/aws"
  version = "3.1.2"

  name           = format("%s-%s", local.name, "terraform-state-lock")
  hash_key       = "LockID"
  billing_mode   = "PROVISIONED"
  write_capacity = 2
  read_capacity  = 2

  attributes = [
    {
      name = "LockID"
      type = "S"
    }
  ]
}
