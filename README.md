
# Infrastructure as Code (IaC) with Terraform on AWS

## Project Overview
This project demonstrates the implementation of a resilient two-tier web architecture on AWS using Terraform.

The infrastructure is provisioned automatically using Infrastructure as Code (IaC).

## Technologies Used
- AWS
- Terraform
- Amazon EC2
- Amazon VPC
- Security Groups
- Internet Gateway
- Linux
- Apache Web Server

## Architecture
The project consists of:

1. VPC with CIDR block 10.0.0.0/16
2. Public Subnet (10.0.1.0/24)
3. Private Subnet (10.0.2.0/24)
4. Internet Gateway
5. Public Route Table
6. Web Server EC2 Instance
7. Database Server EC2 Instance
8. Security Groups

## Security Configuration
- Web Server allows HTTP traffic on port 80.
- Database Server allows MySQL traffic on port 3306 only from the Web Server Security Group.
- Database Server is deployed in the private subnet.

## Project Files
- main.tf – AWS provider and VPC configuration
- variables.tf – Input variables
- network.tf – Subnets, Internet Gateway and routing
- security.tf – Security Groups
- compute.tf – EC2 instances
- outputs.tf – Infrastructure outputs
- .gitignore – Excludes Terraform state and sensitive files

## Deployment Steps

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

To remove the infrastructure:

```bash
terraform destroy
```

## Project Information
**Student:** Isha Jain

**University:** SRM University

**Course:** Cloud Computing

**Project:** Infrastructure as Code with Terraform
