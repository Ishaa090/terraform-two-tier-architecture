# Web Server Public IP

output "web_server_public_ip" {
  description = "Public IP of Web Server"
  value       = aws_instance.web_server.public_ip
}

# Web Server Public DNS

output "web_server_public_dns" {
  description = "Public DNS of Web Server"
  value       = aws_instance.web_server.public_dns
}

# Database Server Private IP

output "database_private_ip" {
  description = "Private IP of Database Server"
  value       = aws_instance.db_server.private_ip
}

# VPC ID

output "vpc_id" {
  description = "Created VPC ID"
  value       = aws_vpc.main.id
}