### VPC 

resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
    enable_dns_hostnames = var.enable_dns_hostnames
    tags = merge(
        var.common_tags,
        var.vpc_tags,
        {
            Name = local.resource_name
        }
    )
}

### Internet Gateway

resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.main.id 

    tags = merge(
        var.common_tags,
        var.igw_tags,
        {
            Name = local.resource_name
        }
    )
}

### 2 Public Subnets

resource "aws_subnet" "public" {
    count =  length(var.public_subnet_cidrs)
    availability_zone = local.az_names[count.index]
    map_public_ip_on_launch = true 
    vpc_id = aws_vpc.main.id 
    cidr_block = var.public_subnet_cidrs[count.index]
    tags = merge(
        var.common_tags,
        var.public_subnet_cidrs_tags,
        {
            Name = "${local.resource_name}-public-${local.az_names[count.index]}"
        }
    )
}

### 2 Private Subnets

resource "aws_subnet" "private" {
    count =  length(var.private_subnet_cidrs)
    availability_zone = local.az_names[count.index]
    map_public_ip_on_launch = false  
    vpc_id = aws_vpc.main.id 
    cidr_block = var.private_subnet_cidrs[count.index]
    tags = merge(
        var.common_tags,
        var.private_subnet_cidrs_tags,
        {
            Name = "${local.resource_name}-private-${local.az_names[count.index]}"
        }
    )
}

### 2 Database Subnets

resource "aws_subnet" "database" {
    count =  length(var.database_subnet_cidrs)
    availability_zone = local.az_names[count.index]
    map_public_ip_on_launch = false  
    vpc_id = aws_vpc.main.id 
    cidr_block = var.database_subnet_cidrs[count.index]
    tags = merge(
        var.common_tags,
        var.database_subnet_cidrs_tags,
        {
            Name = "${local.resource_name}-database-${local.az_names[count.index]}"
        }
    )
}
