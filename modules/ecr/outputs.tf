output "repository_url" {
  value = aws_ecr_repository.this.repository_url
}

output "ssm_parameter_name" {
  value = aws_ssm_parameter.ecr_uri.name
}
