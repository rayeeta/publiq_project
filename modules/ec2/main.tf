resource "aws_security_group" "web_server" {
  name        = "${var.environment}-web-server-sg"
  description = "Security group for web server"
  vpc_id      = var.vpc_id
  
  # HTTP access from specific IPs
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ip}/32", "${var.publiq_ip}/32"]
  }
  
  # SSH access from specific IPs
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ip}/32", "${var.publiq_ip}/32"]
  }
  
  # Outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "${var.environment}-web-server-sg"
    Environment = var.environment
  }
}

resource "aws_instance" "web_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.web_server.id]
  key_name               = var.key_name
  
  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y nginx
              systemctl start nginx
              systemctl enable nginx
              EOF
  
  tags = {
    Name = "${var.environment}-web-server"
    Environment = var.environment
  }
}