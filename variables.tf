variable "tags" {
  description = "The tags to apply to all taggable resources"
  type        = map(string)
}

variable "region" {
  description = "The region to deploy the infrastructure to"
  type        = string
}

variable "name" {
  description = "project name"
  type        = string
}

variable "environment" {
  description = "project environment"
  type        = string
}

variable "profile" {
  description = "AWS Profile"
  type        = string
}