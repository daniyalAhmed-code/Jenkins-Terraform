variable "AWS_REGION" {}
variable "AMIS" {
  type = map
  default = {
    "us-east-2" = "ami-027cab9a7bf0155df"
  }
}
variable "AWS_INSTANCE_TYPE" {}
variable "KEYPAIR_NAME" {}
variable "VPC_CIDR" {}
variable "PUBLIC_SUBNET" {}
variable "PRIVATE_SUBNET" {}
