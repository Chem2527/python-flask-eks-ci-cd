variable "region" {
    description = "The AWS region to deploy resources in"
    type        = string
}

variable "vpc_cidr" {
    description = "The CIDR block for the VPC"
    type        = string
}

variable "vpc_name" {
    description = "The name of the VPC"
    type        = string
}

variable "public_subnet_cidrs" {
    description = "A list of CIDR blocks for the public subnets"
    type        = list(string)
}

variable "private_subnet_cidrs" {
    description = "A list of CIDR blocks for the private subnets"
    type        = list(string)
}

variable "availability_zones" {
    description = "A list of availability zones to deploy the subnets"
    type        = list(string)
}