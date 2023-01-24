terraform {
  backend "s3" {
    bucket = "terraform-bootcamp-tf-bucket"
    key    = "nginx/terraform.tfstate"
    region = "us-east-1"
    
  }
}
