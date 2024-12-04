provider "aws" {
  region = var.region
}

data "aws_ami" "aws_redhat_cis_8" {
  most_recent = true
  filter {
    name = "tag:App"
    values = ["MyApp"]
  }
  filter {
    name = "tag:Type"
    values = ["Backend"]
  }
}

data "template_cloudinit_config" "config" {
  part {
    content = <<-EOT
    #cloud-config
    runcmd:
      - echo "Hello Dragos, Terraform!" > /tmp/terraform-init.log
      - yum update -y
      - echo "valid server config" >>  /tmp/terraform-init.log
    EOT
  }
}

resource "aws_launch_template" "app_launch_template" {
  name          = "app-launch-template"
  image_id      = data.aws_ami.aws_redhat_cis_8.id #var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  user_data = base64encode(data.template_cloudinit_config.config.rendered)

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.app_sg.id]
  }

  tags = merge(var.mandatory_tags, { Name = "AppInstance" }) 
}

resource "aws_autoscaling_group" "app_asg" {
  name                      = "app-auto-scaling-group"
  launch_template {
    id      = aws_launch_template.app_launch_template.id
    version = "$Latest"
  }
  vpc_zone_identifier       = var.subnet_ids
  desired_capacity          = 2
  max_size                  = 3
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"

  
  target_group_arns = [aws_lb_target_group.app_tg.arn]
  tag {
    key                 = "Name"
    value               = "Backend-instance" 
    propagate_at_launch = true
  }

  dynamic "tag" {
    for_each = var.asg_instance_tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}

resource "null_resource" "write_outputs" {
  provisioner "local-exec" {
    command = <<EOT
      echo "ALB DNS Name: $(terraform output -raw alb_dns_name)" > output.txt
      echo "CloudFront Domain Name: $(terraform output -raw cloudfront_domain_name)" >> output.txt
    EOT
  }
}