data "template_file" "init" {
  template = "${file("${path.module}/template/userdata.sh")}"
}

resource "aws_instance" "ec2-instance" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = var.AWS_INSTANCE_TYPE
  tags = {
    Name = "${terraform.workspace}-${var.NAME}-instance"
  }
  # the VPC subnet
  subnet_id =  var.private-subnets-id

  # the security group
  vpc_security_group_ids = [var.instance-security-group-id]

  # the public SSH key
  key_name = var.KEYPAIR_NAME
  user_data  = "${data.template_file.init.rendered}"
}

