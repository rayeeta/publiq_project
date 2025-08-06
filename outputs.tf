output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "instance_id" {
  value = module.ec2.instance_id
}

output "public_ip" {
  value       = module.ec2.public_ip
  description = "Public IP of the web server"
}