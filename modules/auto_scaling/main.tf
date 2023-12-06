
# launch template for each ec2
resource "aws_launch_template" "app-lts" {

  count = length(var.lt_data)

  name = var.lt_data[count.index].name

  image_id = var.ami_ids[count.index]

  instance_initiated_shutdown_behavior = "terminate"

  instance_type = "t2.micro"

  key_name = var.ssh_key_name

  metadata_options {
    http_endpoint          = "enabled"
    instance_metadata_tags = "enabled"
  }

  network_interfaces {
    subnet_id                   = var.subnet_id # 1 subnet only for demonstration, can scale on demand
    security_groups             = var.sg_ids
    associate_public_ip_address = true
  }

  placement {
    availability_zone = var.az
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = var.lt_data[count.index].name
    }
  }
}

# auto scaling group for each launch template; also being linked to ALB
resource "aws_autoscaling_group" "app-asgs" {

  count = length(aws_launch_template.app-lts)

  name               = "${var.lt_data[count.index].name}-asg"
  availability_zones = [var.az]
  desired_capacity   = var.lt_data[count.index].desired_capacity
  max_size           = var.lt_data[count.index].max_size
  min_size           = var.lt_data[count.index].min_size
  target_group_arns  = [var.target_group_arns[count.index]] # assuming each ec2 has 1 target group

  launch_template {
    id      = aws_launch_template.app-lts[count.index].id
    version = "$Latest"
  }
}
