module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-ebd02392"
  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = "subnet-eddcdzz4"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

locals {
  name   = "example-ec2-complete"
  region = "us-east-2"

  user_data = <<-EOT
  #!/bin/bash
  echo "Hello Terraform!"
  EOT

  tags = {
    Owner       = "user"
    Environment = "dev"
  }
}

# # VPC FOR EC2 INSTANCE
# resource "aws_security_group" "public_http" {
#  name        = "public-http"
#  description = "Allow HTTP traffic from public"
#  vpc_id      = "${data.terraform_remote_state.shared.vpc_id}"
# }
# resource "aws_security_group_rule" "public_http" {
#  type              = "ingress"
#  from_port         = 80
#  to_port           = 80
#  protocol          = "tcp"
#  security_group_id = "${aws_security_group.public_http.id}"
#  cidr_blocks       = ["0.0.0.0/0"]
# }