provider "aws" {
    alias = "us-east-1"
    region = var.aws_regions["us_east_1"]
}

provider "aws" {
    alias = "us-east-2"
    region = var.aws_regions["us_east_2"]
  }

  resource "aws_security_group" "multi-sg_vpc1" {
  provider    = aws.us-east-1
  name        = var.security_group_names["sg1"]
  description = "Multi SG managed by tf"
  vpc_id      = var.vpc_ids["vpc1"]
  revoke_rules_on_delete = false

  dynamic "ingress" {
    for_each = var.ingress_ports["sg1"]
    content {
      description = ""
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      description = ""
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = {
    Name = var.tags["sg1"]
  }
}
  
  resource "aws_security_group" "multi_sg_vpc2" {
  provider               = aws.us-east-2
  name                   = var.security_group_names["sg2"]
  description            = "Multi SG managed by tf"
  vpc_id                 = var.vpc_ids["vpc2"]
  revoke_rules_on_delete = false

  dynamic "ingress" {
    for_each = var.ingress_ports["sg2"]
    content {
      description = ""
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      description = ""
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = {
    Name = var.tags["sg2"]
  }
}
  