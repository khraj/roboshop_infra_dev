resource "aws_lb" "frontend_alb" {
  name               = "${local.common_name_suffix}-frontend-alb" #roboshop-dev-frontend-alb
  internal           = false
  load_balancer_type = "application"
  security_groups    = [local.frontend_alb_sg_id]
  subnets            = local.public_subnet_ids

  enable_deletion_protection = false

  tags = merge(
    local.common_tags,
    {
      Name = "${local.common_name_suffix}-frontend-alb"
    }
  )
}

/* resource "aws_lb_target_group" "frontend_alb" {
  name     = "${local.common_name_suffix}"
  port     = 80 #if frontend port is 80 for frontend it is 8080
  protocol = "HTTP"
  vpc_id   = local.vpc_id
  deregistration_delay = 60
  health_check {
    healthy_threshold = 2
    interval = 10
    matcher = "200-299"
    path = "/"
    port = 80
    protocol = "HTTP"
    timeout = 2
    unhealthy_threshold = 2
  }
} */

resource "aws_lb_listener" "frontend_alb" {
  load_balancer_arn = aws_lb.frontend_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-Res-2021-06"
  certificate_arn   = local.frontend_certificate_arn

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Hi, I am from HTTPS frontend ALB</h1>"
      status_code  = "200"
    }
  }
}

resource "aws_route53_record" "frontend_alb" {
  zone_id = var.zone_id
  name    = "roboshop-${var.environment}.${var.domain_name}"  #roboshop-dev.inkweave.dpdns.org
  type    = "A"
  allow_overwrite        = true

  alias {
    #these are abl details not our domain details
    name                   = aws_lb.frontend_alb.dns_name
    zone_id                = aws_lb.frontend_alb.zone_id
    evaluate_target_health = true
    
  }
}

/* resource "aws_lb_listener" "frontend_alb" {
  load_balancer_arn = aws_lb.frontend_alb.arn
  port              = "443"
  protocol          = "HTTPs"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Hello I'm from backend- ALB HTTP"
      status_code  = "200"
    }
  }
}
 */


/* resource "aws_lb_listener" "backend_alb" {
  load_balancer_arn = aws_lb.backend_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Hello I'm from backend- ALB HTTP"
      status_code  = "200"
    }
  }
}

resource "aws_route53_record" "backend_alb" {
  zone_id = var.zone_id
  name    = "*.backend-alb-${var.environment}.${var.domain_name}"
  type    = "A"

  alias {
    #these are abl details not our domain details
    name                   = aws_lb.backend_alb.dns_name
    zone_id                = aws_lb.backend_alb.zone_id
    evaluate_target_health = true
  }
}
 */
