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

#  Module ALB
module "alb" {
  source         = "./modules/alb"
  project        = var.project
  environment    = var.environment
  vpc_id         = module.vpc.vpc_id          # output du module VPC
  public_subnets = module.vpc.public_subnets  # output du module VPC
  alb_sg_id      = module.vpc.alb_sg_id       # output du module VPC
  target_group_port     = var.target_group_port
  target_group_protocol = "HTTP"
}

module "ecs" {
  source               = "./modules/ecs"
  project              = var.project
  environment          = var.environment
  vpc_id               = module.vpc.vpc_id
  private_subnets      = module.vpc.private_subnets
  ecs_sg_id            = module.vpc.ecs_sg_id
  alb_target_group_arn = module.alb.target_group_arn
  container_name       = "nest-api"
  container_image      = "${module.ecr.repository_url}:latest"
  container_port       = 3000
  cpu                  = 256
  memory               = 512
  desired_count        = 2
}