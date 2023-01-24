provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "backend-tf" {
  bucket = "${var.app}-bucket"

  tags = {
    Name        = "${var.app}-bucket"
    Environment = "${var.env}"
  }
}

resource "aws_s3_bucket_acl" "backend-acl-tf" {
  bucket = aws_s3_bucket.backend-tf.id
  acl    = "private"
}