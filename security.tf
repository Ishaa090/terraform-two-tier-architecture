# Security Group for Web Server

resource "aws_security_group" "web_sg" {
  name        = "terraform-web-sg"
  description = "Security group for web server"
  vpc_id      = aws_vpc.main.id

  # Allow HTTP traffic
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Terraform-Web-SG"
  }
}

# Security Group for Database Server

resource "aws_security_group" "db_sg" {
  name        = "terraform-db-sg"
  description = "Security group for database server"
  vpc_id      = aws_vpc.main.id

  # Allow MySQL only from Web Server
  ingress {
    description     = "Allow MySQL from Web Server"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

  # Allow outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Terraform-DB-SG"
  }
}