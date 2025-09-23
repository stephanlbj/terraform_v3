# Boucle sur les environnements
module "ecr" {
  for_each = toset(var.envs_to_create)

  source = "./modules/ecr-repo"

  name = "${local.app_name}-${each.key}"
  env  = each.key
}