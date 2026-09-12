module "vpc" {
    source = "git::https://github.com/khraj/terraform-vpc-module.git?ref=main"
    vpc_cidr_block = var.cidr_block
    project_name = var.project_name
    environment_name = var.environment_name
    vpc_tags = var.vpc_tags
    public_cidrs_subnet = var.public_cidrs_subnet
    private_cidrs_subnet = var.private_cidrs_subnet
    database_cidrs_subnet = var.database_cidrs_subnet
    is_peering_required = false
}

