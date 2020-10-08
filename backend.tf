terraform {
  backend "s3" {
    bucket         = "daniyal-ec2-bucket"
    key            = "state"
    encrypt        = true
    region         = "us-east-2"
    dynamodb_table = "jenkins-test"
  }
}
