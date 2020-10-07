output "vpc-subnet" {
  value = module.vpc.private-subnets-id
}

output "ec2-ip" {
  value = "In ec2"
}