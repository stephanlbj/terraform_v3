# Région AWS
aws_region     = "eu-north-1"

# Environnements à créer
# Ici, uniquement staging
envs_to_create = ["staging"]

# Nom de l'application
app_name       = "my-app"

# Réseau
vpc_cidr        = "10.0.0.0/16"
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
azs             = ["eu-north-1a", "eu-north-1b"]

# Tags
tags = {
  Environment = "staging"
  Project     = "nest-api"
}

environment = "staging"
project     = "nest-api"

# Security Groups
sg_ingress_public = [
  { from_port = 80,  to_port = 80,  protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
  { from_port = 443, to_port = 443, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
]

sg_ingress_private = [
  { from_port = 3000, to_port = 3000, protocol = "tcp", source_security_group_id = "alb_sg_placeholder" }
]

sg_egress = [
  { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"] }
]
