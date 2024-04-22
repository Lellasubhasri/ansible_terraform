# resource "aws_instance" "ansible" {
#   ami                    = "ami-023adaba598e661ac"
#   instance_type          = "t2.small"
#   count                  = 2
#   key_name               = "qwerty"
#   vpc_security_group_ids = [aws_security_group.ansible_server.id]
#   subnet_id              = aws_subnet.public.id
#   depends_on             = [aws_subnet.public]

#   tags = {
#     Name = "ansible-${count.index + 1}"
#   }
# }

# resource "aws_eip" "ansible_server_ip" {
#   count     = length(aws_instance.ansible)
#   instance  = aws_instance.ansible[count.index].id
#   vpc       = true
# }

# resource "aws_lb" "lb" {
#   name               = "asglb"
#   load_balancer_type = "application"
#   internal           = false
#   security_groups    = [aws_security_group.ansible_server.id]
#   subnets            = [var.subnet, var.subnet1]

#   tags = {
#     Name = "lb"
#   }
# }

# resource "aws_lb_target_group" "target" {
#   name        = "targetlb"
#   protocol    = "HTTP"
#   port        = 80
#   vpc_id      = var.vpcid
#   target_type = "instance"

#   health_check {
#     path                = "/"
#     port                = "80"
#     protocol            = "HTTP"
#     interval            = 30
#     timeout             = 5
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#   }
# }

# resource "aws_autoscaling_attachment" "asgtg" {
#   autoscaling_group_name = aws_autoscaling_group.asgname.name
#   lb_target_group_arn    = aws_lb_target_group.target.arn
# }

# resource "aws_launch_configuration" "asg_launch_config" {
#   name          = "asg-launch-config"
#   image_id      = "ami-023adaba598e661ac"  
#   instance_type = "t2.small"              
#   security_groups = [aws_security_group.ansible_server.id]
#   key_name        = "asdfghj"              

# }

# resource "aws_autoscaling_group" "asgname" {
#   launch_configuration      = aws_launch_configuration.asg_launch_config.name
#   min_size                   = 2
#   max_size                   = 2
#   desired_capacity           = 2
#   vpc_zone_identifier        = [var.subnet, var.subnet1]
#   target_group_arns          = [aws_lb_target_group.target.arn]
#   health_check_grace_period = "200"
# }


