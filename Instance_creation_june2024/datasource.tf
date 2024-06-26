provider "aws" {
    regoin = "us-east-1"
}

data "aws_instances" "instance details" {}