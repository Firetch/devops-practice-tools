variable "vpc_id_default" {
    type = string
    default = "vpc-0bdcdd551b87aa65d"
}

variable "type_instance_ec2" {
    type    = string
    default = "t2.micro"
}

variable "subnet_ec2" {
    type    = string
    default = "subnet-0aa41a7df851b704d"
}

variable "access_key" {
    type = string
    default = "ASIA3HYTOE5D4QRJ7JWH"
}

variable "secret_key" {
    type = string
    default = "7JkvCC/opH9LE8SY+CietJ6d88rjgrFSR1typCcl"
}

variable "token" {
    type = string
    default = "FwoGZXIvYXdzEJj//////////wEaDO/noEAmMp0k13pvkSLGAZp/zSEqj3DpPcOI8QSOo6ahHREO0RnggpO10VCskO+jX86wzMzyD37cNF1B6qQFN0BTvJEWoy8DGLo/QULWWfuXYOGLo77hwsQ2/X1W0abi0HO+48uMxCmutzCjvvi0qmaEmCPHtP9JQo9s/mAcHRHiJ/ToCsLmqb+rBSH2itpy6zKJWK65AtHMo8tSJqH2d3kaxJNb8RuN+3cBqZz/ecUpPGuAyUs3Gec0PZGiUCTlP0E1+7YtmL2jbBJg+Tg8imMJiManWyjo07+eBjItqwaZWBL7IfvejKJqbFKyLAr9A9UrKMLgPmk0CybA28oi2M2pDI+Yyo7CqMBk"
}
variable "region" {
    type = string
    default = "us-east-1"
}

variable "server" {
    type = string
    default = "nginx3"
}