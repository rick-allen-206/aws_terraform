module "vpc-a" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-a"
  cidr = "10.65.0.0/16"

  azs             = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets = ["10.65.1.0/24", "10.65.2.0/24", "10.65.3.0/24"]
  public_subnets  = ["10.65.101.0/24", "10.65.102.0/24", "10.65.103.0/24"]

  enable_nat_gateway = true

  tags = {
    Terraform = "true"
    Environment = "prd"
  }
}

module "vpc-b" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-b"
  cidr = "10.66.0.0/16"

  azs             = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets = ["10.66.1.0/24", "10.66.2.0/24", "10.66.3.0/24"]

  tags = {
    Terraform = "true"
    Environment = "uat"
  }
}

module "vpc-c" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-c"
  cidr = "10.67.0.0/16"

  azs             = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets = ["10.67.1.0/24", "10.67.2.0/24", "10.67.3.0/24"]

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}