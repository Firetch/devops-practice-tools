variable "access_key" {
    type = string
    default = ""
}

variable "secret_key" {
    type = string
    default = ""
}

variable "token" {
    type = string
    default = ""
}

variable "app" {
    type = string
    default = "nginx"
}

variable "ami" {
    type = string
    default = "ami-0fe472d8a85bc7b0e"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
  
}