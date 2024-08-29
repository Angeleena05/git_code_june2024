data "aws_key_pair" "angekey" {
  key_name = "angekey"
}

data "aws_security_group" "mysg" {
  name = "mysg"  # Your security group name
}

resource "aws_instance" "IBDTA3VM" {
  ami                    = "ami-0b2b340fdd56e13ce"
  instance_type          = "t2.micro"
  key_name               = data.aws_key_pair.angekey.key_name
  iam_instance_profile   = "ec2_s3_dbarole"
  subnet_id              = var.subnet_id_az2
  vpc_security_group_ids = [data.aws_security_group.mysg.id]

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