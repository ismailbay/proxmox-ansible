terraform {
  required_providers {
    truenas = {
      source  = "deevus/truenas"
      version = "~> 0.1"
    }
    sops = {
      source  = "carlpett/sops"
      version = "~> 1.4"
    }
  }
}

locals {
  processed_apps = {
    for name, cfg in var.custom_apps : name => yamlencode(merge(
      yamldecode(cfg.compose_config),
      {
        services = {
          for svc_name, svc_cfg in yamldecode(cfg.compose_config).services : svc_name => merge(
            svc_cfg,
            {
              environment = merge(
                try(yamldecode(file("${path.module}/.envs/${name}/env.yaml")), {}),
                try(data.sops_file.secrets[name].data, {})
              )
            }
          )
        }
      }
    ))
  }
}

data "sops_file" "secrets" {
  for_each    = { for k, v in var.custom_apps : k => v if fileexists("${path.module}/.envs/${k}/secrets.yaml") }
  source_file = "${path.module}/.envs/${each.key}/secrets.yaml"
}

resource "truenas_app" "app" {
  for_each       = var.custom_apps
  name           = each.key
  custom_app     = true
  compose_config = local.processed_apps[each.key]
}
