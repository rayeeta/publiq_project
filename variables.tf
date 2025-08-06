variable "environment" {
  description = "Environment name (dev, prod)"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  default     = "us-west-1"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "SSH key name for the EC2 instance"
  type        = string
  default     = "Terraform-assignment"
}

variable "my_ip" {
  description = "Your IP address for security group rules"
  type        = string
  default     = "109.138.97.137 /32"
}

variable "publiq_ip" {
  description = "Publiq IP address for security group rules"
  type        = string
  default     = "194.78.13.220"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-014e30c8a36252ae5"
}