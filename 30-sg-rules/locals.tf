/* locals {
  backend-loadbalancer_sg_id = data.aws_ssm_parameter.backend-loadbalancer_sg_id.value
  bastion_alb_id = data.aws_ssm_parameter.bastion_alb_sg_id.value
}
 */

/* locals {
  backend_loadbalancer_sg_id = data.aws_ssm_parameter.backend_loadbalancer_sg_id.value
  bastion_alb_sg_id          = data.aws_ssm_parameter.bastion_alb_sg_id.value
} */

locals {
  backend_loadbalancer_sg_id = data.aws_ssm_parameter.backend_loadbalancer_sg_id.value
  bastion_sg_id              = data.aws_ssm_parameter.bastion_sg_id.value
  mongodb_sg_id             = data.aws_ssm_parameter.mongodb_sg_id.value
  redis_sg_id               = data.aws_ssm_parameter.redis_sg_id.value
  rabbitMQ_sg_id            = data.aws_ssm_parameter.rabbitMQ_sg_id.value
  mysql_sg_id               = data.aws_ssm_parameter.mysql_sg_id.value
}
