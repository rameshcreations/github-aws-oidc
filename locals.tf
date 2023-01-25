locals {
  account_id   = data.aws_caller_identity.current.account_id
  region       = data.aws_region.current.name
  partition    = data.aws_partition.current.partition
  name         = format("%s-%s", var.name, var.environment)
}


