provider "aws" {
  region = "us-east-1"
  }

resource "aws_key_pair" "my_key_pair" {
  key_name   = "my-new-key-pair"
  public_key = file("~/.ssh/my-new-key.pub") # Path to the new public key file
}


data "aws_security_group" "mysg" {
  name = "mysg"  # Your security group name
}

resource "aws_instance" "IBDTA3VM" {
  ami                    = "ami-0b2b340fdd56e13ce"
  instance_type          = "t2.micro"
  iam_instance_profile   = "ec2_s3_dbarole"
  vpc_security_group_ids = [data.aws_security_group.mysg.id]
  key_name               = aws_key_pair.my_key_pair.key_name

  tags = {
    Name        = "IBDAP3VM"
    bu          = var.TagBU
    owner       = var.TagOwner
    environment = var.TagEnv
    product     = var.TagProduct
    component   = var.TagComponent
    servicename = var.TagServiceName
  }
}