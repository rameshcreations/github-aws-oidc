output "github_role_arn" {
  description = "Github OIDC Role ARN"
  value = aws_iam_role.this.arn
}