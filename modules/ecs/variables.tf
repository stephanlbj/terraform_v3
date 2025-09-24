variable "project" {
  type        = string
  description = "Project name"
}

variable "environment" {
  type        = string
  description = "Environment (staging, preprod, prod)"
}

variable "vpc_id" {
  type = string
  description = "VPC ID where ECS tasks will run"
}

variable "private_subnets" {
  type        = list(string)
  description = "Private subnets for ECS tasks"
}

variable "ecs_sg_id" {
  type        = string
  description = "Security group for ECS tasks"
}

variable "alb_target_group_arn" {
  type        = string
  description = "ALB target group ARN (leave empty if not using ALB)"
  default     = ""
}

variable "container_name" {
  type        = string
  description = "Container name for ECS task"
}

variable "container_image" {
  type        = string
  description = "Full ECR image URI"
}

variable "container_port" {
  type    = number
  default = 3000
}

variable "cpu" {
  type    = number
  default = 256
}

variable "memory" {
  type    = number
  default = 512
}

variable "desired_count" {
  type    = number
  default = 2
}
