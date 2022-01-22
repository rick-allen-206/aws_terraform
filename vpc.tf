module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-a"
  cidr = "10.65.0.0/16"

  azs             = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets = ["10.65.1.0/24", "10.65.2.0/24", "10.65.3.0/24"]
  public_subnets  = ["10.65.101.0/24", "10.65.102.0/24", "10.65.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}