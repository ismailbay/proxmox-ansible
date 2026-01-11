terraform {
  required_version = ">= 1.6.0"

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.92"
    }
    sops = {
      source  = "carlpett/sops"
      version = "~> 1.3"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3"
    }
  }
}

data "sops_file" "secrets" {
  source_file = "${path.module}/secrets.sops.yaml"
}

provider "proxmox" {
  endpoint  = data.sops_file.secrets.data["proxmox.endpoint"]
  api_token = data.sops_file.secrets.data["proxmox.api_token"]
  ssh {
    agent       = false
    private_key = file("~/.ssh/id_ansible_pve.pub") # TODO: create new keys
  }
}
