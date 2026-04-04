provider "truenas" {
  host        = "192.168.1.153"
  auth_method = "ssh"

  ssh {
    port                 = 22
    user                 = "terraform"
    private_key          = file("~/.ssh/id_terraform_truenas")
    host_key_fingerprint = "SHA256:RM72vI/QgxdNPp2wyqEfejULVhN3kHrgGLLa+h5UgKk" # ssh-keyscan <host> | ssh-keygen -lf -
  }
}

data "truenas_dataset" "app-configs" {
  pool = "ssd-pool"
  path = "app-configs"
}

data "truenas_pool" "tank" {
  name = "tank"
}

data "truenas_pool" "ssd-pool" {
  name = "ssd-pool"
}

resource "truenas_app" "gitea" {
  name       = "gitea"
  custom_app = false
  lifecycle {
    ignore_changes = [compose_config]
  }
}

resource "truenas_app" "immich" {
  name       = "immich"
  custom_app = false
  lifecycle {
    ignore_changes = [compose_config]
  }
}

resource "truenas_app" "jellyfin" {
  name       = "jellyfin"
  custom_app = false
  lifecycle {
    ignore_changes = [compose_config]
  }
}

resource "truenas_app" "paperless-ngx" {
  name       = "paperless-ngx"
  custom_app = false
  lifecycle {
    ignore_changes = [compose_config]
  }
}

resource "truenas_app" "prowlarr" {
  name       = "prowlarr"
  custom_app = false
  lifecycle {
    ignore_changes = [compose_config]
  }
}

resource "truenas_app" "radarr" {
  name       = "radarr"
  custom_app = false
  lifecycle {
    ignore_changes = [compose_config]
  }
}

resource "truenas_app" "recyclarr" {
  name       = "recyclarr"
  custom_app = false
  lifecycle {
    ignore_changes = [compose_config]
  }
}

resource "truenas_app" "sabnzbd" {
  name       = "sabnzbd"
  custom_app = false
  lifecycle {
    ignore_changes = [compose_config]
  }
}

resource "truenas_app" "sonarr" {
  name       = "sonarr"
  custom_app = false
  lifecycle {
    ignore_changes = [compose_config]
  }
}

resource "truenas_dataset" "apps" {
  atime       = "OFF"
  compression = "LZ4"
  path        = "apps"
  pool        = "ssd-pool"
}

module "truenas_apps" {
  source = "./modules/truenas-app"
  custom_apps = {
    nginx = {
      compose_config = <<-EOF
        version: "3"
        services:
          web:
            image: nginx
        EOF
    }
  }
}
