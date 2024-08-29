variable "aws_region" {
  description = "Default Region for the VPC"
  default     = "us-east-1"
}

variable "vpc_env" {
  description = "VPC Env"
  default     = "prod"
}

variable "vpc_id" {
  description = "VPC Id"
  default     = "vpc-05218bf8bf1b4b30a"
}

variable "account_id" {
  description = "AWS Account Number"
  default     = "858901935665"
}

variable "subnet_id_az1" {
  description = "Subnet AZ1"
  default     = "subnet-0f4713dc71b0b37e3"
}

variable "subnet_id_az2" {
  description = "Subnet AZ2"
  default     = "subnet-06530c09ccb6fbf1e"
}

variable "subnet_id_az3" {
  description = "Subnet AZ3"
  default     = "subnet-0ffb1900d3a44b542"
}

variable "deployment_role" {
  description = "Name of role for deployment"
  default     = "djif-admin"
}

variable "TagEnv" {
  default = "prod"
}

variable "TagServiceName" {
  description = "Service Name"
  type        = string
  default     = "djif/sp/sharsvc"
}

variable "TagOwner" {
  default = "aws-cloudops@dowjones.com "
}

variable "TagBU" {
  default = "djif"
}

variable "TagProduct" {
  default = "sp"
}

variable "TagComponent" {
  default = "sharsvc"
}

variable "appid" {
  default = "ibdprint"
}

variable "s3_bucket_name" {
  description = "s3 bucket for DB backups"
  default     = "dj-ibdprint-prod-db-backups-virginia"
}

variable "ibd-distribution-cert" {
  description = "IBD Distribution SSL cert arn"
  default     = "arn:aws:acm:us-east-1:858901935665:certificate/db83db41-afcd-4e0c-872d-8d51ef69d411"
}

variable "pub_subnet_id_az1" {
  description = "Public Subnet AZ1"
  default     = "subnet-00f59643117094c60"
}

variable "pub_subnet_id_az2" {
  description = "Public Subnet AZ2"
  default     = "subnet-0f967f56621956051"
}