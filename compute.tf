# Find Latest Amazon Linux 2023 AMI

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Create Web Server in Public Subnet

resource "aws_instance" "web_server" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true
  key_name                    = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    dnf update -y
    dnf install -y httpd
    systemctl enable httpd
    systemctl start httpd

    cat > /var/www/html/index.html <<'HTML'
    <html>
      <head>
        <title>Terraform Two Tier Project</title>
      </head>
      <body style="font-family:Arial;text-align:center;margin-top:80px">
        <h1>Infrastructure as Code with Terraform</h1>
        <h2>Two-Tier Web Architecture</h2>
        <p>Web Server successfully deployed using Terraform!</p>
        <p>SRM University | Cloud Computing Project</p>
      </body>
    </html>
    HTML
  EOF

  tags = {
    Name = "Terraform-Web-Server"
  }
}

# Create Database Server in Private Subnet

resource "aws_instance" "db_server" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  key_name               = var.key_name

  tags = {
    Name = "Terraform-Database-Server"
  }
}