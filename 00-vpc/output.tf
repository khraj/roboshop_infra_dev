output "vpc_id" {
    value = module.vpc.vpc_id
}

output "azs" {
    value = module.vpc.aws_availability_zones
}

output "public_sub_id" {
    value = module.vpc.public_subnet_ids
}

output "private_sub_Id" {
    value = module.vpc.private_subnet_ids
}

output "datebase_sub_id" {
    value = module.vpc.database_subnet_ids
}