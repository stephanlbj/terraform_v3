variable "name" {
  type        = string
  description = "Nom du repo ECR (ex: my-app-staging)"
}

variable "env" {
  type        = string
  description = "Environnement (staging, preprod, prod)"
}
