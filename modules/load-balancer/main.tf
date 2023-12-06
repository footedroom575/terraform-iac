
# setting up target groups for each instance
resource "aws_lb_target_group" "target_groups" {
  count = length(var.tg_names)

  name             = var.tg_names[count.index]
  port             = 3000
  protocol         = "HTTP"
  protocol_version = "HTTP1"
  vpc_id           = var.vpc_id

  health_check {
    path     = var.tg_hc_paths[count.index]
    protocol = "HTTP"
  }
}

# commenting below because now the target groups are auto-scaled

# # attaching target groups to their respective ec2
# resource "aws_lb_target_group_attachment" "tg_ec2_attachement" {
#   count = length(var.instance_ids)

#   target_group_arn = aws_lb_target_group.target_groups[count.index].arn
#   target_id        = var.instance_ids[count.index]
#   port             = 3000
# }

# setting up alb
resource "aws_lb" "app_lb" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.sg_ids
  subnets            = var.subnet_ids

  tags = {
    Environment = "production"
  }
}

# making a listener for lb and sending fixed response if rules dont match
resource "aws_lb_listener" "lb_listerner" {

  load_balancer_arn = aws_lb.app_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "no such endpoint exists"
      status_code  = "404"
    }
  }
}

# making rules to redirect the lb to the respective app endpoint
resource "aws_lb_listener_rule" "rules" {
  count = length(var.lb_rule_paths)

  listener_arn = aws_lb_listener.lb_listerner.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_groups[count.index].arn
  }

  condition {
    path_pattern { # to make both /api and /api/ work for example
      values = [var.lb_rule_paths[count.index], "${var.lb_rule_paths[count.index]}/*"]
    }
  }
}
