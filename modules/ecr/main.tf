resource "aws_ecr_repository" "this" {
  name                 = var.name
  image_tag_mutability = "MUTABLE"

  tags = {
    Environment = var.env
    ManagedBy   = "terraform"
  }
}

resource "aws_ssm_parameter" "ecr_uri" {
  name        = "/ecr/${var.env}/uri"
  type        = "String"
  value       = aws_ecr_repository.this.repository_url
  description = "ECR repository URI for ${var.env}"
  overwrite   = true
}
