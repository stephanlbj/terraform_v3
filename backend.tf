terraform {
  backend "s3" {
  # bucket         = "my-terraform-states"  
   bucket         = "my-terraform-states-api-deploy" 
   key            = "infra/ecr/terraform.tfstate"   
   region         = "eu-north-1"                  
   # workspace_key_prefix = "env:"
   # use_lockfile   = true
   dynamodb_table = "terraform-locks"
   encrypt        = true

   
  }
}
