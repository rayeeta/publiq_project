# Junior Cloud Engineer Home Assignment

This repository contains Terraform code to provision a simple web application infrastructure in AWS with support for multiple environments (dev and prod).

## Prerequisites

- AWS CLI installed and configured
- Terraform installed (v1.0.0 or newer)
- Your public IP address (for security group rules)

## Project Structure

project-root/
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
├── setup_remote_backend.tf
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── ec2/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── envs/
│   ├── dev/
│   │   ├── backend.hcl
│   │   └── dev.tfvars
│   └── prod/
│       ├── backend.hcl
│       └── prod.tfvars
└── README.md


## Deployment Instructions

### 1. Create S3 Buckets and DynamoDB Tables for Remote State

First, deploy the infrastructure for the Terraform remote state:

```bash
# Initialize Terraform (local state)
terraform init

Apply only the remote backend setup

Dev environment
terraform apply terraform init -backend-config=envs/dev/backend.hcl
terraform apply -var-file=envs/dev/dev.tfvars

Prod environment
terraform apply terraform init -backend-config=envs/prod/backend.hcl
terraform apply -var-file=envs/prod/prod.tfvars

To very if the webserver is running in your browser, copy and paste the public_ip of the ec2_instance
http://<your_ec2_public_ip> and hit ENTER on your keyboard.

Make sure to destroy all the created resources with the following command

Dev 
terraform destroy -var-file=envs/dev/dev.tfvars

Prod
terraform destroy -var-file=envs/prod/prod.tfvars

