output "ecr_repos" {
  value = { for k, m in module.ecr : k => m.repository_url }
}

output "ssm_parameters" {
  value = { for k, m in module.ecr : k => m.ssm_parameter_name }
}
