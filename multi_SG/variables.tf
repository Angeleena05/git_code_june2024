variable "aws_regions" {
  description = "AWS regions to use"
  type        = map(string)
  default     = {
    us_east_1 = "us-east-1"
    us_east_2 = "us-east-2"
  }
}

variable "vpc_ids" {
  description = "VPC IDs"
  type        = map(string)
  default     = {
    vpc1 = "vpc-0d822cffdb28fac51"
    vpc2 = "vpc-010f755ad20ff4d56"
  }
}

variable "security_group_names" {
  description = "Security Group Names"
  type        = map(string)
  default     = {
    sg1 = "multi_SG"
    sg2 = "multi_sg"
  }
}

variable "tags" {
  description = "Tags for security groups"
  type        = map(string)
  default     = {
    sg1 = "SG_for_VPC1"
    sg2 = "SG_for_VPC2"
  }
}

variable "ingress_ports" {
  description = "Ingress ports"
  type        = map(list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })))

  default     = {
    sg1 = [
      { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"]},
      { from_port = 443, to_port = 443, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
    ]
    sg2 = [
      { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 3389, to_port = 3389, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }
}

variable "egress_rules" {
  description = "Egress rules"
  type        = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default     = [
    { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"] }
  ]
}
