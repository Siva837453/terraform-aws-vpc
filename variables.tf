### project variables

variable "Project_name" {
    type = string
  
}

variable "common_tags" {
    type = map 
    
}

variable "Environment" {
    type = string
    default = "dev"
  
}

## vpc
variable "cidr_block" {
    type = string
    default = "10.0.0.0/16"
  
}

variable "enable_dns_hostnames" {

    type = bool
    default = true
  
}

variable "vpc_tags" {
  
    default = {}
}

### IGW

variable "ig_tags" {
    default = {}
    type = map
}

##public subnet
variable "public_subnet_tags" {

    default = {}
    type= map
  
}

variable "public_subnet_cidrs" {

    type = list 
    validation {
        condition = length(var.public_subnet_cidrs) == 2
        error_message = "please provide 2 valid public subnet cidrs"
    }

}

##private subnet
variable "private_subnet_tags" {

    default = {}
    type= map
  
}

variable "private_subnet_cidrs" {

    type = list 
    validation {
        condition = length(var.private_subnet_cidrs) == 2
        error_message = "please provide 2 valid private subnet cidrs"
    }

}

##database subnet
variable "database_subnet_tags" {

    default = {}
    type= map
  
}

variable "database_subnet_cidrs" {

    type = list 
    validation {
        condition = length(var.database_subnet_cidrs) == 2
        error_message = "please provide 2 valid database subnet cidrs"
    }

}

##NAT GATE WAY

variable "nat_gateway_tags" {
    type = map
    default = {}
  
}

##public route table
variable "public_route_tags" {
    type = map
    default = {}
  
}

##private route table
variable "private_route_tags" {
    type = map
    default = {}
  
}
##database route table
variable "database_route_tags" {
    type = map
    default = {}
  
}


variable "is_peering_required" {
    type= bool
    default = false
  
}

variable "acceptor_vpc" {
    type= string
    default = ""
  
}

variable "vpc_peering_tags" {
    type = map
    default = {}
  
}


