terraform {
  cloud {
    organization = "ismailbay"
    hostname     = "app.terraform.io"

    workspaces {
      name = "opentofu"
    }
  }
}
