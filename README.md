# Github OIDC Integration with AWS
GitHub OIDC token will be used to Authenticate with AWS to create the resources with terraform pipeline. The local backend has been configured with `terraform workspace` for the NON-AWS organization accounts. Also this will creating AWS S3 bucket that will be use by the main terraform application the backend. Before starting, make sure th configure the AWS profile and setup `profile` variable.

* Creating New Workspace

```bash
terraform workspace new rails-master
```
Note : If you're using the existing terraform workspace, make sure to switch the workspace before run/modification.
* Apply Terraform 

```bash
#Terraform Init
terraform init

#Terraform Plan
terraform plan -var-file=envs/master/ca-central-1/terraform.tfvars -var-file=envs/master/global/terraform.tfvars

#Terraform Apply
terraform apply -var-file=envs/master/ca-central-1/terraform.tfvars -var-file=envs/master/global/terraform.tfvars --auto-approve
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.51.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.51.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3_backend"></a> [s3\_backend](#module\_s3\_backend) | terraform-aws-modules/s3-bucket/aws | 3.6.1 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_default_tags.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/default_tags) | data source |
| [aws_iam_policy_document.github](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | project environment | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | project name | `string` | n/a | yes |
| <a name="input_profile"></a> [profile](#input\_profile) | AWS Profile | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region to deploy the infrastructure to | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags to apply to all taggable resources | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_github_role_arn"></a> [github\_role\_arn](#output\_github\_role\_arn) | Github OIDC Role ARN |
<!-- END_TF_DOCS -->