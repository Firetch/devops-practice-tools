terraform {
  backend "s3" {
    bucket         = "terraform-bootcamp-tf-bucket-state"
    key            = "wordpress-vpc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-bootcamp-tf-state-lock"
  }
}