resource "aws_iam_openid_connect_provider" "this" {
    url = "https://token.actions.githubusercontent.com"
    client_id_list = [
        "sts.amazonaws.com",
    ]
    thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"]
}

resource "aws_iam_role" "this" {
    name = format("%s-%s",local.name,"github-oidc")
    assume_role_policy = data.aws_iam_policy_document.github.json
}

module "s3_backend" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "3.6.1"
  
  bucket = local.name
  acl    = "private"

  versioning = {
    enabled = true
  }

}