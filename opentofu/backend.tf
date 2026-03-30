terraform {
  required_version = ">= 1.6.0"

  cloud {
    organization = "ismailbay"
    hostname     = "app.terraform.io"

    workspaces {
      name = "opentofu"
    }
  }

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.99"
    }
    sops = {
      source  = "carlpett/sops"
      version = "~> 1.4"
    }
    truenas = {
      source  = "deevus/truenas"
      version = "~> 0.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3"
    }
  }
}
