module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "default-alb"

  load_balancer_type = "application"

  vpc_id             = "vpc-abcde012" # PEGAR O VPC_ID DO VARS
  subnets            = ["subnet-abcde012", "subnet-bcde012a"] # PEGAR DO VARS
  security_groups    = ["sg-edcd9784", "sg-edcd9785"] # PEGAR DO VARS

  access_logs = {
    bucket = "my-alb-logs"
  }

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = [
        {
          target_id = "i-0123456789abcdefg" # PEGAR DO VARS OU OUTPUT NAO SEI AINDA
          port = 80
        }
      ]
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "Test"
  }
}