data "aws_default_tags" "current" {}
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "aws_partition" "current" {}

data "aws_iam_policy_document" "github" {
    statement {
        effect = "Allow"
        actions = ["sts:AssumeRoleWithWebIdentity"]

        principals {
            type = "Federated"
            identifiers = [aws_iam_openid_connect_provider.this.arn]
        }

        condition {
            test = "StringEquals"
            variable = "token.actions.githubusercontent.com:aud"
            values = ["sts.amazonaws.com"]
        }

        condition {
             test = "StringLike"
             variable = "token.actions.githubusercontent.com:sub"
             values = ["repo:rameshcreations/rails-iac:*","repo:rameshcreations/rails-with-redis:*"]
        }
    }
}