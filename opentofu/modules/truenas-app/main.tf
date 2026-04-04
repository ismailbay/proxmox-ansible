terraform {
  required_providers {
    truenas = {
      source  = "deevus/truenas"
      version = "~> 0.1"
    }
  }
}

resource "truenas_app" "app" {
  for_each       = var.custom_apps
  name           = each.key
  custom_app     = true
  compose_config = each.value.compose_config
}
