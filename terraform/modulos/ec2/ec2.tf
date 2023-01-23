module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "${var.app}-${var.env}"

  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.ec2-sg.id]
  subnet_id              = var.subnet_id


  tags = {
    Terraform   = "true"
    Environment = var.env
  }
}