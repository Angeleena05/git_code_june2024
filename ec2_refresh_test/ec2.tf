    provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ivanti1" {
  ami                     = "ami-016a78934c9cfa396"
  instance_type           = "t2.2xlarge"
  vpc_security_group_ids = [aws_security_group.security_group_test.id]
  subnet_id              = "subnet-08ef1feff0a78f336" 
  

root_block_device {
        volume_size = var.root_v_size
        volume_type = var.root_v_type
    }
}


resource "aws_security_group" "security_group_test" {
  name        = "security_group_test"
  description = "SG managed by Terraform"
  vpc_id      = "vpc-05cc823f34a97639c"  

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
