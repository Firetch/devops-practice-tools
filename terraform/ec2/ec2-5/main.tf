#AWS
#AMI=ami-0fe472d8a85bc7b0e
#SG= 22
#vpc= vpc-0c4286bbfc54cb66e
#Subnet=subnet-0b61716db7bd7dff6 (e)
#terraform init
#terraform validate
#terraform plan
#terraform apply -auto-approve

provider "aws" {
  region     = "us-east-1"
  access_key = "ASIA3HYTOE5D4QRJ7JWH"
  secret_key = "7JkvCC/opH9LE8SY+CietJ6d88rjgrFSR1typCcl"
  token      = "FwoGZXIvYXdzEJj//////////wEaDO/noEAmMp0k13pvkSLGAZp/zSEqj3DpPcOI8QSOo6ahHREO0RnggpO10VCskO+jX86wzMzyD37cNF1B6qQFN0BTvJEWoy8DGLo/QULWWfuXYOGLo77hwsQ2/X1W0abi0HO+48uMxCmutzCjvvi0qmaEmCPHtP9JQo9s/mAcHRHiJ/ToCsLmqb+rBSH2itpy6zKJWK65AtHMo8tSJqH2d3kaxJNb8RuN+3cBqZz/ecUpPGuAyUs3Gec0PZGiUCTlP0E1+7YtmL2jbBJg+Tg8imMJiManWyjo07+eBjItqwaZWBL7IfvejKJqbFKyLAr9A9UrKMLgPmk0CybA28oi2M2pDI+Yyo7CqMBk"
}

#DATA

data "aws_ami" "amazon" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Canonical
}


#RECURSOS
resource "aws_security_group" "nginx-sg" {
  name = "nginx2-sg"
  vpc_id = "vpc-0bdcdd551b87aa65d"

  ingress {
    description      = "Access SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nginx2-sg"
  }
}

resource "aws_instance" "server" {
  ami                    = data.aws_ami.amazon.id
  instance_type          = "t2.micro"
  subnet_id              = "subnet-0aa41a7df851b704d"
  vpc_security_group_ids = [aws_security_group.nginx-sg.id]
  tags = {
    Name = "nginx-server-tf"
  }
  user_data = <<EOF
#! /bin/bash
sudo amazon-linux-extras install -y nginx1
sudo service nginx start
sudo rm /usr/share/nginx/html/index.html
echo '<html><head><title>Bootcamp Terraform Server</title></head><body style=\"background-color:#1F778D\"><p style=\"text-align: center;\"><span style=\"color:#FFFFFF;\"><span style=\"font-size:28px;\">Welcome to &#127819; Bootcamp</span></span></p></body></html>' | sudo tee /usr/share/nginx/html/index.html
EOF
}
