# Boucle sur les environnements
module "ecr" {
  for_each = toset(var.envs_to_create)

  source = "./modules/ecr"

  name = "${var.app_name}-${each.key}"
  env  = each.key
}