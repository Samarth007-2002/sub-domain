
resource "aws_lb_listener_certificate" "example" {
  listener_arn    = data.aws_lb_listener.selected443.arn
  certificate_arn = data.aws_acm_certificate.cert.arn
  depends_on = [
    aws_acm_certificate_validation.cert
  ]
}

resource "aws_lb_target_group" "ecs" {
  name                 = "${local.common_name}-${var.Sandbox}"
  port                 = 3000
  protocol             = "HTTP"
  target_type          = "ip"
  vpc_id               = data.aws_vpc.vpc.id
  deregistration_delay = 60
}

resource "aws_lb_listener_rule" "static" {
   lifecycle {
    create_before_destroy = true
  }
  listener_arn = data.aws_lb_listener.selected443.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs.arn
  }

  condition {
    host_header {
      values = ["static2.${var.domain_name}"]
    }
  }
}

