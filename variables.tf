variable "aws_region" {
  type    = string
  default = "eu-west-1"
}

variable "envs_to_create" {
  type    = list(string)
  default = ["staging"]
}
