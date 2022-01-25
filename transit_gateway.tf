module "tgw" {
  source  = "terraform-aws-modules/transit-gateway/aws"
  version = "2.4.0"

  name        = "tgw"
  description = "test tgw"

  enable_auto_accept_shared_attachments = true
  enable_default_route_table_association = false
  enable_default_route_table_propagation = false
  enable_dns_support = true

  ram_allow_external_principals = true
  ram_principals                = [307990089504]

  vpc_attachments = {
    vpc-a = {
      vpc_id      = module.vpc-a.vpc_id
      subnet_ids  = module.vpc-a.private_subnets
      dns_support = true

      transit_gateway_default_route_table_association = false
      transit_gateway_default_route_table_propagation = false
      # tgw_routes = [
      #   { destination_cidr_block = "10.65.0.0/16" },
      #   { destination_cidr_block = "10.66.0.0/16" },
      #   { destination_cidr_block = "10.67.0.0/16" }
      # ]
    },
    vpc-b = {
      vpc_id      = module.vpc-b.vpc_id
      subnet_ids  = module.vpc-b.private_subnets
      dns_support = true

      transit_gateway_default_route_table_association = false
      transit_gateway_default_route_table_propagation = false
      # tgw_routes = [
      #   { destination_cidr_block = "10.65.0.0/16" },
      #   { destination_cidr_block = "10.66.0.0/16" },
      #   { destination_cidr_block = "10.67.0.0/16" }
      # ]
    },
    vpc-c = {
      vpc_id      = module.vpc-c.vpc_id
      subnet_ids  = module.vpc-c.private_subnets
      dns_support = true

      transit_gateway_default_route_table_association = false
      transit_gateway_default_route_table_propagation = false
      # tgw_routes = [
      #   { destination_cidr_block = "10.65.0.0/16" },
      #   { destination_cidr_block = "10.66.0.0/16" },
      #   { destination_cidr_block = "10.67.0.0/16" }
      # ]
    }
  }
}
