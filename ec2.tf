data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*"]
  }
}

resource "aws_instance" "server1" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.sg1.id]
  key_name               = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "Server-1"
  }
}

resource "aws_instance" "server2" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.subnet2.id
  vpc_security_group_ids = [aws_security_group.sg2.id]
  key_name               = var.key_name
  associate_public_ip_address = true
  tags = {
    Name = "Server-2"
  }
}


