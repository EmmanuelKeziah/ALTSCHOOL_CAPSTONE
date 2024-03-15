custom_vpc_name                               = "sock_project-vpc"
custom_vpc_cidr_block                         = "10.0.0.0/16"
custom_vpc_availability_zones                 = ["eu-west-2a", "eu-west-2b"]
custom_vpc_public_subnets                     = ["10.0.101.0/24", "10.0.102.0/24"]
custom_vpc_database_subnets                   = ["10.0.151.0/24", "10.0.152.0/24"]
custom_vpc_create_database_subnet_group       = "true"
custom_vpc_create_database_subnet_route_table = "true"
custom_vpc_enable_nat_gateway                 = "true"
custom_vpc_single_nat_gateway                 = "true"
custom_vpc_enable_dns_hostnames               = "true"
custom_vpc_enable_dns_support                 = "true"
