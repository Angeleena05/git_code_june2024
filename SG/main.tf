provider "aws" {
  region = "us-east-1" 
}

resource "aws_security_group" "security_group_test" {
  name        = "security_group_test"
  description = "SG managed by Terraform"
  vpc_id      = "vpc-0d822cffdb28fac51"  

 dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks 
      }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks 
      }
  }

  tags = {
    Name = "security_group_test"
  }
}

