resource "proxmox_virtual_environment_oci_image" "openbao" {
  node_name           = "pve-mini-1"
  datastore_id        = "local"
  reference           = "ghcr.io/openbao/openbao:2.4"
  upload_timeout      = 900
  overwrite           = true
  overwrite_unmanaged = true
}

output "template_openbao_id" {
  value = proxmox_virtual_environment_oci_image.openbao.id
}

resource "proxmox_virtual_environment_container" "openbao" {
  node_name = "pve-mini-1"
  vm_id     = 109

  unprivileged = true
  features {
    nesting = true
  }

  initialization {
    hostname = "openbao"
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_account {
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKbJSmbCeDjS0o9ggGab+qvesi6zulkfwXv25pBIblT1 ismailbay@gmail.com"
      ]
    }
  }

  environment_variables = {
    PATH                  = "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
    NAME                  = "openbao"
    VERSION               = "2.4"
    TEST_ENV              = "ibay"
    BAO_DEV_ROOT_TOKEN_ID = data.sops_file.secrets.data["credentials.openbao_admin_token"]
    BAO_CONFIG_DIR        = "/mnt/bao_config"
  }

  cpu {
    cores = 2
    units = 100
  }

  memory {
    dedicated = 512
    swap      = 0
  }

  disk {
    datastore_id = "local-lvm"
    size         = 8
  }

  mount_point {
    path   = "/mnt/bao_config"
    size   = "1G"
    volume = "local-lvm"
    backup = true
  }

  operating_system {
    template_file_id = proxmox_virtual_environment_oci_image.openbao.id
    type             = "alpine"
  }

  network_interface {
    name     = "eth0"
    bridge   = "vmbr0"
    firewall = true
  }
}
