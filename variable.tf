variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t3.micro"
}

variable "name_tag" {
  description = "Name tag for EC2 instance"
  type        = string
  default     = "My EC2 Instance"
}