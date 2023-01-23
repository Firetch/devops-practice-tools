resource "aws_key_pair" "server_key" {
  key_name = "${var.app}_key"
  public_key = file("keys/aws_terraform.pub")
}

resource "aws_instance" "server" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  subnet_id = data.aws_subnet.az_a.id
  vpc_security_group_ids = [aws_security_group.ec2-sg.id]
  key_name = aws_key_pair.server_key.key_name
  tags = {
    Name = "${var.app}-${var.env}"
  }
}
