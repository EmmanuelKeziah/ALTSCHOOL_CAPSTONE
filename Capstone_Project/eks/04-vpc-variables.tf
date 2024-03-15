# Custom VPC Input Variables

# Custom VPC Name
variable "custom_vpc_name" {
  description = "Specify a custom name for the VPC"
  type        = string
}

# Custom VPC CIDR Block
variable "custom_vpc_cidr_block" {
  description = "Define the IPv4 CIDR block for the VPC"
  type        = string
}

# Custom VPC Availability Zones
variable "custom_vpc_availability_zones" {
  description = "Provide a list of availability zones for the VPC"
  type        = list(string)
}

# Custom VPC Public Subnets
variable "custom_vpc_public_subnets" {
  description = "Specify the public subnets within the VPC"
  type        = list(string)
}

# Custom VPC Database Subnets
variable "custom_vpc_database_subnets" {
  description = "Specify the database subnets within the VPC"
  type        = list(string)
}

# Custom VPC Create Database Subnet Group (True / False)
variable "custom_vpc_create_database_subnet_group" {
  description = "Choose whether to create a custom database subnet group"
  type        = bool
}

# Custom VPC Create Database Subnet Route Table (True or False)
variable "custom_vpc_create_database_subnet_route_table" {
  description = "Choose whether to create a custom database subnet route table"
  type        = bool
}

# Custom VPC Enable NAT Gateway (True or False) 
variable "custom_vpc_enable_nat_gateway" {
  description = "Enable or disable NAT Gateways for outbound communication in custom private subnets"
  type        = bool
}

# Custom VPC Single NAT Gateway (True or False)
variable "custom_vpc_single_nat_gateway" {
  description = "Choose whether to enable only a single NAT Gateway in one Availability Zone to save costs during demos"
  type        = bool
}

# Custom VPC Enable DNS Hostnames (True or False)
variable "custom_vpc_enable_dns_hostnames" {
  description = "Choose whether the custom VPC should have DNS hostname support"
  type        = bool
}

# Custom VPC Enable DNS Support (True or False)
variable "custom_vpc_enable_dns_support" {
  description = "Choose whether the custom VPC should have DNS support"
  type        = bool
}
