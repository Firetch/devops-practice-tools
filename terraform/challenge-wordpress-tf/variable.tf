locals {
  common_tags = {
    Terraform = "true"
    Environment = var.env
    Owner = "DevOps Team"
    Project = "${var.app}-devops"
  }
}

variable "app" {
  default = "bootcamp"
}

variable "env" {
  default = "dev"
}
### variables base de datos

variable "db_user" {
  default = "wordpress_user"
}

variable "db_pass" {
  default = "12345678"
}

variable "db_name" {
  default = "wordpress"
}

variable "instance_class" {
  default = "db.t2.micro"
}

### variables instancias ec2

variable "ami" {
  default = "ami-0fe472d8a85bc7b0e"
}

variable "instance_type" {
  default = "t2.micro"
}