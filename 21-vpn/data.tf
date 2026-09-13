data "aws_ami" "openvpn" {
  owners      = ["679593333241"]
  most_recent = true

  filter {
    name   = "name"
    values = ["OpenVPN Access Server Community Image-8fbe3379-*"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

/* data "aws_ssm_parameter" "bastion_sg_id" {
  name = "/${var.project_name}/${var.environment}/bastion_sg_id"
}
 */
/* 
data "aws_ssm_parameter" "bastion_sg_id" {
  name = "/${var.project_name}/${var.environment}/bastion_sg_id"
} */


data "aws_ssm_parameter" "open_vpn_sg_id" {
  name = "/${var.project_name}/${var.environment}/open_vpn_sg_id"
}

data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/public_subnet_ids"
}

data "aws_ssm_parameter" "private_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/private_subnet_ids"
}

data "aws_ssm_parameter" "frontend_sg_id" {
  name = "/${var.project_name}/${var.environment}/frontend_sg_id"
}

data "aws_ssm_parameter" "user_sg_id" {
  name = "/${var.project_name}/${var.environment}/user_sg_id"
}

data "aws_ssm_parameter" "cart_sg_id" {
  name = "/${var.project_name}/${var.environment}/cart_sg_id"
}

data "aws_ssm_parameter" "payment_sg_id" {
  name = "/${var.project_name}/${var.environment}/payment_sg_id"
}

data "aws_ssm_parameter" "shipping_sg_id" {
  name = "/${var.project_name}/${var.environment}/shipping_sg_id"
}