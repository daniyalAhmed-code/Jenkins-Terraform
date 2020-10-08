output "ec2-instance-id"{
  value = aws_instance.ec2-instance.id
}

output "ec2-instance-ip"{
  value = aws_instance.ec2-instance.public_ip
}
