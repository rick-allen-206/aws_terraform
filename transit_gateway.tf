module "tgw" {
  source  = "terraform-aws-modules/transit-gateway/aws"
  version = "~> 2.0"

  name        = "tgw"
  description = "test tgw"

  enable_auto_accept_shared_attachments = true

  vpc_attachments = {
    vpc-a = {
      vpc_id      = module.vpc.vpc_id
      subnet_ids  = module.vpc.private_subnets
      dns_support = true

      # enable_default_route_table_association          = true
      # enable_default_route_table_propagation          = true
      transit_gateway_default_route_table_association = false
      transit_gateway_default_route_table_propagation = false
      tgw_routes = [
        { destination_cidr_block = "10.65.0.0/16" },
        { destination_cidr_block = "10.66.0.0/16" },
        { destination_cidr_block = "10.67.0.0/16" }
      ]
    }
  }

  ram_allow_external_principals = true
  ram_principals                = [307990089504]
}
