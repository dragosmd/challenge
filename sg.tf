# Security Group for ALB and EC2
resource "aws_security_group" "app_sg" {
  name_prefix = "app-sg-"

  ingress {
    description      = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 ingress {
   description      = "https"
   from_port        = 443
   to_port          = 443
   protocol         = "tcp"
   cidr_blocks      = ["10.105.42.0/24","10.105.41.0/24"]
  }  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
