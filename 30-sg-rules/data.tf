/* data "aws_ssm_parameter" "backend-loadbalancer_sg_id" {
    name = "/${var.project_name}-/${var.environment}-/backend-loadbalancer_sg_id"
}

data "aws_ssm_parameter" "bastion_alb_sg_id" {
  name = "/${var.project_name}-/${var.environment}-/bastion_alb_sg_id"
} */

data "aws_ssm_parameter" "backend_loadbalancer_sg_id" {
  name = "/${var.project_name}/${var.environment}/backend_loadbalancer_sg_id"
}

data "aws_ssm_parameter" "bastion_sg_id" {
  name = "/${var.project_name}/${var.environment}/bastion_sg_id"
}

data "aws_ssm_parameter" "mongodb_sg_id" {
  name = "/${var.project_name}/${var.environment}/mongodb_sg_id"
}

data "aws_ssm_parameter" "redis_sg_id" {
  name = "/${var.project_name}/${var.environment}/redis_sg_id"
}

data "aws_ssm_parameter" "rabbitMQ_sg_id" {
  name = "/${var.project_name}/${var.environment}/rabbitMQ_sg_id"
}

data "aws_ssm_parameter" "mysql_sg_id" {
  name = "/${var.project_name}/${var.environment}/mysql_sg_id"
}

data "aws_ssm_parameter" "catalogue_sg_id" {
  name = "/${var.project_name}/${var.environment}/catalogue_sg_id"
}

data "aws_ssm_parameter" "frontend_alb_sg_id" {
  name = "/${var.project_name}/${var.environment}/frontend_alb_sg_id"
}

