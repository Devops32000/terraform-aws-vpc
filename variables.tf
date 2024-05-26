variable "project_name" {
    type = string 
}
variable "environment" {
    type = string 
    default = "dev"
}
variable "common_tags" {
    type = map 
}

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"  
}

variable "enable_dns_hostnames" {
    type = bool 
    default = true
}
variable "vpc_tags" {
    type = map 
    default = {} 
}
variable "igw_tags" {
    type = map 
    default = {} 
}

### Public Subnet 

variable "public_subnet_cidrs" {
    type = list 
    validation {
      condition = length(var.public_subnet_cidrs) == 2 
      error_message = "Please provide 2 valid public subent cidr"

    }
}
variable "public_subnet_cidrs_tags" {
    type = map 
    default = {}  
}


### Private Subnet 

variable "private_subnet_cidrs" {
    type = list 
    validation {
      condition = length(var.private_subnet_cidrs) == 2 
      error_message = "Please provide 2 valid private subent cidr"

    }
}
variable "private_subnet_cidrs_tags" {
    type = map 
    default = {}  
}

variable "nat_gateway_tags" {
    type = map 
    default = {}  
}

### Database Subnet 

variable "database_subnet_cidrs" {
    type = list 
    validation {
      condition = length(var.database_subnet_cidrs) == 2 
      error_message = "Please provide 2 valid database subent cidr"

    }
}
variable "database_subnet_cidrs_tags" {
    type = map 
    default = {}  
}

# Public Route Table 

variable "public_route_table_tags" {
    type = map 
    default = {}  
}

# Private Route Table 

variable "private_route_table_tags" {
    type = map 
    default = {}  
}

# Database Route Table 

variable "database_route_table_tags" {
    type = map 
    default = {}  
}
