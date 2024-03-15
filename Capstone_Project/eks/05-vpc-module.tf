# Fetching AWS Availability Zones Data
data "aws_availability_zones" "available" {
  # Fetching the list of available AWS availability zones, excluding "eu-west-2-iah-1a".
  exclude_names = ["eu-west-2-iah-1a"]
}

# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.2"

  # Configuring the VPC with essential details.
  name            = "${local.name}-${var.custom_vpc_name}"
  cidr            = var.custom_vpc_cidr_block
  azs             = data.aws_availability_zones.available.names
  public_subnets  = var.custom_vpc_public_subnets

  map_public_ip_on_launch = true 

  # Configuring the database subnets.
  create_database_subnet_group       = var.custom_vpc_create_database_subnet_group
  create_database_subnet_route_table = var.custom_vpc_create_database_subnet_route_table
  database_subnets                   = var.custom_vpc_database_subnets

  # Configuring NAT Gateways for outbound communication.
  enable_nat_gateway = var.custom_vpc_enable_nat_gateway
  single_nat_gateway = var.custom_vpc_single_nat_gateway

  # Configuring VPC DNS parameters.
  enable_dns_hostnames = var.custom_vpc_enable_dns_hostnames
  enable_dns_support   = var.custom_vpc_enable_dns_support

  # Configuring VPC tags.
  tags     = local.common_tags
  vpc_tags = local.common_tags

  # Configuring additional tags for public subnets.
  public_subnet_tags = {
    Type                                              = "Public Subnets"
    "kubernetes.io/role/elb"                          = 1
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"
  }


  # Configuring additional tags for database subnets.
  database_subnet_tags = {
    Type = "Database Subnets"
  }
}
