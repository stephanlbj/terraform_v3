terraform {
  backend "s3" {
    bucket         = "my-terraform-states"         
    key            = "infra/ecr/terraform.tfstate"   
    region         = "eu-north-1"                  
    workspace_key_prefix = "env:"
    use_lockfile   = true
  }
}
