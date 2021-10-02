resource "aws_security_group" "this" {
  name        = var.name
  description = "Allow All"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "sg-${var.name}"
    Terraform = true
  }
}


resource "aws_instance" "this" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.small"
  availability_zone      = data.aws_availability_zones.available.names[0]
  key_name               = "thenaim"
  vpc_security_group_ids = [aws_security_group.this.id]

  tags = {
    Name      = var.name
    Terraform = true
  }
}

