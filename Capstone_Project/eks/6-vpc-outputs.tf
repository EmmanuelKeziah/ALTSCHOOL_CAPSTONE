# VPC Output Values

# Unique Identifier of the VPC
output "vpc_id" {
  description = "This output provides the unique identifier of the Virtual Private Cloud (VPC)"
  value       = module.vpc.vpc_id
}

# Network Address Range of the VPC
output "vpc_cidr_block" {
  description = "This output provides the network address range of the VPC"
  value       = module.vpc.vpc_cidr_block
}

# Public Subnet Identifiers within the VPC
output "public_subnets" {
  description = "This output provides the list of public subnet identifiers within the VPC"
  value       = module.vpc.public_subnets
}

# Public Elastic IPs created for the NAT Gateway
output "nat_public_ips" {
  description = "This output provides the list of public Elastic IPs created for the AWS NAT Gateway"
  value       = module.vpc.nat_public_ips
}

# Availability Zones specified for the VPC
output "azs" {
  description = "This output provides the list of availability zones specified as arguments to this module"
  value       = module.vpc.azs
}
