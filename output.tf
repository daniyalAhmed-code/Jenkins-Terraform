output "vpc-subnet" {
  value = module.vpc.private-subnets-id
}

output "ec2-ip" {
  value = module.ec2-instance.public_ip
}