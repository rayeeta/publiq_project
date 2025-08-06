variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, prod)"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "SSH key name for the EC2 instance"
  type        = string
}

variable "my_ip" {
  description = "Your IP address for security group rules"
  type        = string
}

variable "publiq_ip" {
  description = "Publiq IP address for security group rules"
  type        = string
  default     = "194.78.13.220"
}