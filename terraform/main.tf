provider "aws" {
    region = var.aws_region
}

# VPC Module
module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = var.vpc_cidr_block
    region = var.aws_region
    availability_zones = var.availability_zones
    public_subnet_cidrs = var.public_subnet_cidrs
    private_subnet_cidrs = var.private_subnet_cidrs
    vpc_name = var.vpc_name
}

# Security Group Module
module "security_group" {
    source = "./modules/security_group"
    vpc_id = module.vpc.vpc_id
    security_group_name = var.security_group_name
    security_group_description = var.security_group_description
    ingress_from_port = var.ingress_from_port
    ingress_to_port = var.ingress_to_port
    ingress_protocol = var.ingress_protocol
    ingress_cidr_blocks = var.ingress_cidr_blocks
    egress_from_port = var.egress_from_port
    egress_to_port = var.egress_to_port
    egress_protocol = var.egress_protocol
    egress_cidr_blocks = var.egress_cidr_blocks

    tags = {
        Environment = var.environment
        Project     = var.project_name
    }
}

# EC2 Module
module "ec2" {
    source = "./modules/ec2"
    region = var.aws_region
    ami_id = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = module.vpc.public_subnet_ids[0]
    associate_public_ip = true
    security_groups = [module.security_group.security_group_id]
    volume_size = var.volume_size
    volume_type = var.volume_type
    instance_name = var.instance_name
    additional_tags = var.additional_tags
}

# EKS Module
module "eks" {
    source = "./modules/eks"
    vpc_id = module.vpc.vpc_id
    subnet_ids = module.vpc.public_subnet_ids
}

# ECR Module
module "ecr" {
    source = "./modules/ecr"
    repository_name = var.ecr_repository_name
    image_tag_mutability = var.ecr_image_tag_mutability
    scan_on_push = var.ecr_scan_on_push
    tags = {
        Environment = var.environment
        Project     = var.project_name
    }
}

# S3 Module for Terraform State Backend
module "s3" {
    source = "./modules/s3"
    s3_bucket_name = var.s3_bucket_name
    s3_key = "terraform/state"
    dynamodb_table_name = var.dynamodb_table_name
    aws_region = var.aws_region
}

terraform {
    backend "s3" {
        bucket         = "my-terraform-state-bucket733751"
        key            = "terraform.tfstate"
        region         = "eu-north-1"
    }
}
