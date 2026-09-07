/* module "roboshop-sg" {
    source = "terraform-aws-modules/security-group/aws"

    name = "${local.common_name_suffix}-catalogue"   
    use_name_prefix = false
    description = "sg for catalogue with custom ports open within VPC, egress all traffic"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    tags = {
        Name = "${local.common_name_suffix}-catalogue"
    }
} */

module "sg" {

    count = length(var.sg_names)
    source = "git::https://github.com/khraj/terraform-security-group-module.git?ref=main"

    project_name = var.project_name
    environment = var.environment
    sg_name = var.sg_names[count.index]
    sg_description = "created for ${var.sg_names[count.index]} service"
    vpc_id = local.vpc_id
}

/* resource "aws_security_group_rule" "frontend_frontend_alb" {
    type = "ingress"
    security_group_id = module.sg[9].sg-id
    source_security_group_id = module.sg[11].sg-id
    from_port = 80
    to_port = 80
    protocol = "tcp"
} */