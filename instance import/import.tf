provider "aws" {
    region = "us-east-1"
}

import {
  to = aws_instance.importserver
  id = "i-0d636fa3b369ae39e"
}

