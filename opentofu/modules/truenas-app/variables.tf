variable "custom_apps" {
  description = "List of apps to install"
  type = map(object({
    compose_config = string
  }))
}
