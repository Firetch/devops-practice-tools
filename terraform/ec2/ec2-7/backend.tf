terraform {
  backend "s3" {
    bucket         = "terraform-bootcamp-tf-bucket-state"
    key            = "nginx-ec2/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-bootcamp-tf-state-lock"
  }
}
