provider "aws" {
region = "us-east-1"
}

resource "random_pet" "dev" {
  length = 2
}

resource "random_pet" "test" {
  length = 2
}

resource "random_pet" "prod" {
  length = 2
}

resource "aws_s3_bucket" "dev_bucket" {
  bucket = "myapp-${random_pet.dev.id}"
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = "myapp-${random_pet.test.id}"
}

resource "aws_s3_bucket" "prod_bucket" {
  bucket = "myapp-${random_pet.prod.id}"
}
