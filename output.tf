output "vpc-subnet" {
  value = module.vpc.private-subnets-id
}

output "Logging" {
  value = "Hello from the other side"
}