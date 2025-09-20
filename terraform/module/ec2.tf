/*
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.image_ami]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

*/


resource "aws_key_pair" "my_key" {
  key_name = "my-key"
  public_key = file(var.public_key)

  tags = {
    Name = "my-key ${var.env}"
  }
}

resource "aws_instance" "my_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id = aws_subnet.public.id
  key_name = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.my-sg.id]
  associate_public_ip_address = true
  availability_zone = var.availability_zone

    root_block_device {
    volume_size = var.disk_size       # Size in GB
    volume_type = "gp3"      # General Purpose SSD
    delete_on_termination = true
  }


  tags = {
    Name = "my-ec2 ${var.env}"
  }
}

resource "aws_security_group" "my-sg" {
  name        = "my-sg"
  description = "Security group with multiple ports"
  vpc_id      = aws_vpc.my_vpc.id

  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

    tags = {
    Name = "my-sg ${var.env}"
  }

}

/*
resource "aws_instance" "private_ec2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.private.id
  associate_public_ip_address = false   
  vpc_security_group_ids      = [aws_security_group.private_sg.id]
  key_name                    = aws_key_pair.my_key.key_name

  tags = {
    Name = "private-instance"
  }
}

# Private SG → allow SSH only from Public SG
resource "aws_security_group" "private_sg" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.my-sg.id] # only from bastion
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "private-sg" }
}

*/