locals {
    common_name_suffix = "${var.project_name}-${var.environment}" #roboshop-dev
    mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
    redis_sg_id = data.aws_ssm_parameter.redis_sg_id.value
    rabbitmq_sg_id = data.aws_ssm_parameter.rabbitMQ_sg_id.value
    mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id.value
    database_subnet_id = split("," , data.aws_ssm_parameter.database_subnet_ids.value)[0]
    catalogue_sg_id = data.aws_ssm_parameter.catalogue_sg_id.value
    user_sg_id = data.aws_ssm_parameter.user_sg_id.value.value
    payment_sg_id = data.aws_ssm_parameter.payment_sg_id.value
    shipping_sg_id = data.aws_ssm_parameter.shipping_sg_id.value
    frontend_sg_id = data.aws_ssm_parameter.frontend_sg_id.value
    ami_id = data.aws_ami.krishna.id
    common_tags = {
        Project     = var.project_name
        Environment = var.environment
        Terraform   = "true"
    }
     
}
