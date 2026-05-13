data "sops_file" "secrets" {
  source_file = "${path.module}/secrets.sops.yaml"
}

provider "proxmox" {
  endpoint  = data.sops_file.secrets.data["proxmox.endpoint"]
  api_token = data.sops_file.secrets.data["proxmox.api_token"]
  ssh {
    agent       = false
    private_key = file("~/.ssh/id_terraform_pve")
    username    = "root"
  }
}
