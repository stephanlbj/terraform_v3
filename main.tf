# Boucle sur les environnements
module "ecr" {
  for_each = toset(var.envs_to_create)

  source = "./modules/ecr"

  name = "${var.app_name}-${each.key}"
  env  = each.key
}

# Module VPC
module "vpc" {
  source          = "./modules/vpc"
  project         = var.project
  environment     = var.environment
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
  tags            = var.tags
  sg_ingress_private = var.sg_ingress_private
  sg_ingress_public  = var.sg_ingress_public
  sg_egress          = var.sg_egress
}