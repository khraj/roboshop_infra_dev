resource "aws_ssm_parameter" "frontend_certificate_arn" {
  name  = "/${var.project_name}/${var.environment}/frontend_certificate_arn"
  type  = "StringList"
  value = aws_acm_certificate.roboshop.arn
}