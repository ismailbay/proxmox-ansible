resource "proxmox_virtual_environment_container" "pihole" {
  vm_id        = 100
  node_name    = "pve-rack"
  tags         = ["core", "network"]
  unprivileged = true

  cpu {
    cores = 2
    units = 500 # > higher priority
  }
  disk {
    datastore_id = "local-lvm"
    size         = 4
  }
  initialization {
    hostname = "pihole"
    ip_config {
      ipv4 {
        address = "192.168.1.20/24"
        gateway = "192.168.1.1"
      }
    }
  }
  memory {
    dedicated = 1024
    swap      = 0
  }
  network_interface {
    bridge      = "vmbr0"
    mac_address = "BC:24:11:DD:5C:25"
    name        = "eth0"
  }
  operating_system {
    template_file_id = ""
    type             = "debian"
  }
  startup {
    order = 1
  }
}

resource "proxmox_virtual_environment_container" "traefik" {
  vm_id        = 101
  node_name    = "pve-rack"
  tags         = ["core", "network"]
  unprivileged = true

  cpu {
    cores = 2
    units = 500
  }
  disk {
    datastore_id = "local-lvm"
    size         = 12
  }
  initialization {
    hostname = "traefik"
    ip_config {
      ipv4 {
        address = "192.168.1.21/24"
        gateway = "192.168.1.1"
      }
    }
  }
  memory {
    dedicated = 1024
    swap      = 0
  }
  network_interface {
    bridge      = "vmbr0"
    mac_address = "BC:24:11:7D:66:23"
    name        = "eth0"
  }
  operating_system {
    template_file_id = ""
    type             = "debian"
  }
  startup {
    order = 2
  }
}

resource "proxmox_virtual_environment_container" "gatus" {
  vm_id        = 102
  node_name    = "pve-rack"
  tags         = ["observability"]
  unprivileged = true

  cpu {
    cores = 1
    units = 100
  }
  disk {
    datastore_id = "local-lvm"
    size         = 8
  }
  initialization {
    hostname = "gatus"
    ip_config {
      ipv4 {
        address = "192.168.1.245/24"
        gateway = "192.168.1.1"
      }
    }
  }
  memory {
    dedicated = 1024
    swap      = 0
  }
  network_interface {
    bridge      = "vmbr0"
    mac_address = "BC:24:11:D0:C6:07"
    name        = "eth0"
  }
  operating_system {
    template_file_id = ""
    type             = "debian"
  }
}

resource "proxmox_virtual_environment_container" "cloudflare-ddns" {
  vm_id        = 103
  node_name    = "pve-rack"
  tags         = ["network"]
  unprivileged = true

  cpu {
    architecture = "amd64"
    cores        = 1
    units        = 100
  }
  disk {
    datastore_id = "local-lvm"
    size         = 3
  }
  initialization {
    hostname = "cloudflare-ddns"
    ip_config {
      ipv4 {
        address = "192.168.1.222/24"
        gateway = "192.168.1.1"
      }
    }
  }
  memory {
    dedicated = 1024
    swap      = 0
  }
  network_interface {
    bridge      = "vmbr0"
    mac_address = "BC:24:11:B7:79:52"
    name        = "eth0"
  }
  operating_system {
    template_file_id = ""
    type             = "debian"
  }
}

resource "proxmox_virtual_environment_container" "authelia" {
  vm_id        = 104
  node_name    = "pve-rack"
  tags         = ["core"]
  unprivileged = true

  cpu {
    cores = 1
    units = 300 # > higher priority
  }
  disk {
    datastore_id = "local-lvm"
    size         = 2
  }
  initialization {
    hostname = "authelia"
    ip_config {
      ipv4 {
        address = "192.168.1.230/24"
        gateway = "192.168.1.1"
      }
    }
  }
  memory {
    dedicated = 512
    swap      = 0
  }
  network_interface {
    bridge      = "vmbr0"
    mac_address = "BC:24:11:1B:6C:6F"
    name        = "eth0"
  }
  operating_system {
    template_file_id = ""
    type             = "debian"
  }
}

resource "proxmox_virtual_environment_container" "glance" {
  vm_id        = 105
  node_name    = "pve-rack"
  unprivileged = true

  cpu {
    cores = 1
    units = 100
  }
  disk {
    datastore_id = "local-lvm"
    size         = 2
  }
  initialization {
    hostname = "glance"
    ip_config {
      ipv4 {
        address = "192.168.1.187/24"
        gateway = "192.168.1.1"
      }
    }
  }
  memory {
    dedicated = 1024
    swap      = 0
  }
  network_interface {
    bridge      = "vmbr0"
    mac_address = "BC:24:11:AA:57:E4"
    name        = "eth0"
  }
  operating_system {
    template_file_id = ""
    type             = "debian"
  }
}

resource "proxmox_virtual_environment_container" "mqtt" {
  vm_id        = 106
  node_name    = "pve-rack"
  tags         = ["database"]
  unprivileged = true

  cpu {
    cores = 1
    units = 100
  }
  disk {
    datastore_id = "local-lvm"
    size         = 2
  }
  initialization {
    hostname = "mqtt"
    ip_config {
      ipv4 {
        address = "192.168.1.157/24"
        gateway = "192.168.1.1"
      }
    }
  }
  memory {
    dedicated = 512
    swap      = 0
  }
  network_interface {
    bridge      = "vmbr0"
    mac_address = "BC:24:11:DF:83:7F"
    name        = "eth0"
  }
  operating_system {
    template_file_id = ""
    type             = "debian"
  }
}

resource "proxmox_virtual_environment_container" "gotify" {
  vm_id        = 107
  node_name    = "pve-rack"
  tags         = ["observability"]
  unprivileged = true

  cpu {
    cores = 1
    units = 100
  }
  disk {
    datastore_id = "local-lvm"
    size         = 2
  }
  initialization {
    hostname = "gotify"
    ip_config {
      ipv4 {
        address = "192.168.1.215/24"
        gateway = "192.168.1.1"
      }
    }
  }
  memory {
    dedicated = 512
    swap      = 0
  }
  network_interface {
    bridge      = "vmbr0"
    mac_address = "BC:24:11:77:B9:D1"
    name        = "eth0"
  }
  operating_system {
    template_file_id = ""
    type             = "debian"
  }
}

resource "proxmox_virtual_environment_container" "otelcollector" {
  vm_id        = 108
  node_name    = "pve-rack"
  tags         = ["observability"]
  unprivileged = true

  cpu {
    cores = 2
    units = 100
  }
  disk {
    datastore_id = "local-lvm"
    size         = 4
  }
  initialization {
    hostname = "otelcollector"
    ip_config {
      ipv4 {
        address = "192.168.1.236/24"
        gateway = "192.168.1.1"
      }
    }
  }
  memory {
    dedicated = 1024
    swap      = 0
  }
  network_interface {
    bridge      = "vmbr0"
    mac_address = "BC:24:11:13:67:98"
    name        = "eth0"
  }
  operating_system {
    template_file_id = ""
    type             = "debian"
  }
}

resource "proxmox_virtual_environment_container" "netbird" {
  vm_id        = 110
  node_name    = "pve-rack"
  tags         = ["network"]
  unprivileged = true

  cpu {
    cores = 2
    units = 1024
  }
  disk {
    datastore_id = "local-lvm"
    size         = 4
  }
  initialization {
    hostname = "netbird"
    ip_config {
      ipv4 {
        address = "192.168.1.235/24"
        gateway = "192.168.1.1"
      }
    }
  }
  memory {
    dedicated = 1024
    swap      = 0
  }
  network_interface {
    bridge      = "vmbr0"
    mac_address = "BC:24:11:9F:45:3F"
    name        = "eth0"
    firewall    = true
  }
  operating_system {
    template_file_id = ""
    type             = "debian"
  }
}

resource "proxmox_virtual_environment_container" "postgresql" {
  vm_id        = 111
  node_name    = "pve-rack"
  tags         = ["database"]
  unprivileged = true

  cpu {
    cores = 1
    units = 100
  }
  disk {
    datastore_id = "local-lvm"
    size         = 8
  }
  initialization {
    hostname = "postgresql"
    ip_config {
      ipv4 {
        address = "192.168.1.130/24"
        gateway = "192.168.1.1"
      }
    }
  }
  memory {
    dedicated = 1024
    swap      = 0
  }
  network_interface {
    bridge      = "vmbr0"
    mac_address = "BC:24:11:4F:B3:76"
    name        = "eth0"
  }
  operating_system {
    template_file_id = ""
    type             = "debian"
  }
}

resource "proxmox_virtual_environment_container" "unifi" {
  vm_id        = 113
  node_name    = "pve-mini-1"
  tags         = ["network"]
  unprivileged = true

  cpu {
    cores = 2
    units = 1024
  }
  disk {
    datastore_id = "local-lvm"
    size         = 8
  }
  initialization {
    hostname = "unifi"
    ip_config {
      ipv4 {
        address = "192.168.1.173/24"
        gateway = "192.168.1.1"
      }
    }
  }
  memory {
    dedicated = 2048
    swap      = 0
  }
  network_interface {
    bridge      = "vmbr0"
    mac_address = "BC:24:11:10:67:76"
    name        = "eth0"
  }
  operating_system {
    template_file_id = ""
    type             = "debian"
  }
}

resource "proxmox_virtual_environment_container" "victoriametrics" {
  vm_id        = 114
  node_name    = "pve-rack"
  tags         = ["observability"]
  unprivileged = true

  cpu {
    cores = 2
    units = 100
  }
  disk {
    datastore_id = "local-lvm"
    size         = 16
  }
  initialization {
    hostname = "victoriametrics"
    ip_config {
      ipv4 {
        address = "192.168.1.107/24"
        gateway = "192.168.1.1"
      }
    }
  }
  memory {
    dedicated = 2048
    swap      = 0
  }
  network_interface {
    bridge      = "vmbr0"
    mac_address = "BC:24:11:93:AB:61"
    name        = "eth0"
  }
  operating_system {
    template_file_id = ""
    type             = "debian"
  }
}

resource "proxmox_virtual_environment_container" "grafana" {
  vm_id        = 115
  node_name    = "pve-rack"
  tags         = ["observability"]
  unprivileged = true

  cpu {
    cores = 2
    units = 100
  }
  disk {
    datastore_id = "local-lvm"
    size         = 4
  }
  initialization {
    hostname = "grafana"
    ip_config {
      ipv4 {
        address = "192.168.1.233/24"
        gateway = "192.168.1.1"
      }
    }
  }
  memory {
    dedicated = 1024
    swap      = 0
  }
  network_interface {
    bridge      = "vmbr0"
    mac_address = "BC:24:11:78:7B:D4"
    name        = "eth0"
  }
  operating_system {
    template_file_id = ""
    type             = "alpine"
  }
}

resource "proxmox_virtual_environment_container" "proxmox-datacenter-manager" {
  vm_id        = 117
  node_name    = "pve-rack"
  unprivileged = true
  cpu {
    architecture = "amd64"
    cores        = 2
    units        = 300
  }
  disk {
    datastore_id = "local-lvm"
    size         = 10
  }
  initialization {
    hostname = "proxmox-datacenter-manager"
    ip_config {
      ipv4 {
        address = "192.168.1.185/24"
        gateway = "192.168.1.1"
      }
    }
  }
  memory {
    dedicated = 2048
    swap      = 512
  }
  network_interface {
    bridge      = "vmbr0"
    mac_address = "BC:24:11:19:63:75"
    name        = "eth0"
  }
  operating_system {
    template_file_id = ""
    type             = "debian"
  }
}

resource "proxmox_virtual_environment_container" "proxmox-backup-server" {
  vm_id        = 200
  node_name    = "pve-rack"
  tags         = ["backup", "core"]
  unprivileged = false

  cpu {
    cores = 2
    units = 100
  }
  disk {
    datastore_id = "local-lvm"
    size         = 10
  }
  initialization {
    hostname = "proxmox-backup-server"
    ip_config {
      ipv4 {
        address = "192.168.1.116/24"
        gateway = "192.168.1.1"
      }
    }
  }
  memory {
    dedicated = 2048
    swap      = 512
  }
  network_interface {
    bridge      = "vmbr0"
    mac_address = "BC:24:11:3E:4B:EA"
    name        = "eth0"
  }
  operating_system {
    template_file_id = ""
    type             = "debian"
  }
}

# __generated__ by OpenTofu
resource "proxmox_virtual_environment_vm" "truenas" {
  acpi                                 = true
  bios                                 = "seabios"
  boot_order                           = ["scsi0"]
  delete_unreferenced_disks_on_destroy = true
  hook_script_file_id                  = null
  keyboard_layout                      = "en-us"
  kvm_arguments                        = ""
  machine                              = ""
  migrate                              = false
  name                                 = "truenas"
  node_name                            = "pve-rack"
  on_boot                              = true
  pool_id                              = ""
  protection                           = false
  purge_on_destroy                     = true
  reboot                               = false
  reboot_after_update                  = true
  scsi_hardware                        = "virtio-scsi-single"
  started                              = true
  stop_on_destroy                      = false
  tablet_device                        = false
  tags                                 = ["153"]
  template                             = false
  timeout_clone                        = 1800
  timeout_create                       = 1800
  timeout_migrate                      = 1800
  timeout_reboot                       = 1800
  timeout_shutdown_vm                  = 1800
  timeout_start_vm                     = 1800
  timeout_stop_vm                      = 300
  vm_id                                = 112
  agent {
    enabled = true
    timeout = "15m"
    trim    = false
    type    = "virtio"
  }
  cpu {
    architecture = ""
    cores        = 4
    flags        = []
    hotplugged   = 0
    limit        = 0
    numa         = false
    sockets      = 1
    type         = "x86-64-v2-AES"
  }
  disk {
    aio               = "io_uring"
    backup            = true
    cache             = "none"
    datastore_id      = "local-lvm"
    discard           = "ignore"
    file_format       = "raw"
    file_id           = ""
    import_from       = ""
    interface         = "scsi0"
    iothread          = true
    path_in_datastore = "vm-112-disk-0"
    replicate         = true
    serial            = ""
    size              = 64
    ssd               = true
  }
  hostpci {
    device   = "hostpci0"
    id       = "0000:01:00"
    mapping  = ""
    mdev     = ""
    pcie     = false
    rom_file = ""
    rombar   = false
    xvga     = false
  }
  memory {
    dedicated      = 32768
    floating       = 0
    keep_hugepages = false
    shared         = 0
  }
  network_device {
    bridge       = "vmbr0"
    disconnected = false
    firewall     = true
    mac_address  = "BC:24:11:21:66:B5"
    model        = "virtio"
    mtu          = 0
    queues       = 0
    rate_limit   = 0
    trunks       = ""
    vlan_id      = 0
  }
  operating_system {
    type = "l26"
  }
  startup {
    down_delay = -1
    order      = 1
    up_delay   = 180
  }
  lifecycle {
    ignore_changes = [mac_addresses]
  }
}

resource "proxmox_virtual_environment_vm" "haos" {
  acpi                                 = true
  bios                                 = "ovmf"
  boot_order                           = ["scsi0"]
  delete_unreferenced_disks_on_destroy = true
  hook_script_file_id                  = null
  keyboard_layout                      = "en-us"
  kvm_arguments                        = ""
  machine                              = "q35"
  migrate                              = false
  name                                 = "haos"
  node_name                            = "pve-rack"
  on_boot                              = true
  pool_id                              = ""
  protection                           = false
  purge_on_destroy                     = true
  reboot                               = false
  reboot_after_update                  = true
  scsi_hardware                        = "virtio-scsi-pci"
  started                              = true
  stop_on_destroy                      = false
  tablet_device                        = false
  tags                                 = ["180", "community-script"]
  template                             = false
  vm_id                                = 116
  agent {
    enabled = true
    timeout = "15m"
    trim    = false
    type    = "virtio"
  }
  cpu {
    architecture = ""
    cores        = 2
    flags        = []
    hotplugged   = 0
    limit        = 0
    numa         = false
    sockets      = 1
    type         = "qemu64"
  }
  disk {
    aio               = "io_uring"
    backup            = true
    cache             = "none"
    datastore_id      = "local-lvm"
    discard           = "on"
    file_format       = "raw"
    file_id           = ""
    import_from       = ""
    interface         = "scsi0"
    iothread          = false
    path_in_datastore = "vm-116-disk-1"
    replicate         = true
    serial            = ""
    size              = 32
    ssd               = true
  }
  efi_disk {
    datastore_id      = "local-lvm"
    file_format       = "raw"
    pre_enrolled_keys = false
    type              = "4m"
  }
  memory {
    dedicated      = 2048
    floating       = 0
    keep_hugepages = false
    shared         = 0
  }
  network_device {
    bridge       = "vmbr0"
    disconnected = false
    firewall     = false
    mac_address  = "02:CB:48:0D:18:D5"
    model        = "virtio"
    mtu          = 0
    queues       = 0
    rate_limit   = 0
    trunks       = ""
    vlan_id      = 0
  }
  operating_system {
    type = "l26"
  }
  serial_device {
    device = "socket"
  }
  lifecycle {
    ignore_changes = [mac_addresses]
  }
}

locals {
  openbaoVersion = "2.5.3"
}

resource "proxmox_virtual_environment_file" "openbao-cloud-init" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = "pve-mini-2"

  source_raw {
    data = <<-EOF
    #cloud-config
    hostname: openbao
    timezone: Europe/Vienna
    users:
      - default
      - name: ibay
        groups:
          - sudo
        shell: /bin/bash
        ssh-authorized-keys:
          - "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKbJSmbCeDjS0o9ggGab+qvesi6zulkfwXv25pBIblT1 macbook"
        sudo: ALL=(ALL) NOPASSWD:ALL
    apt:
      preserve_sources_list: true
      sources:
        openbao:
          keyserver: https://openbao.org/assets/openbao-gpg-pub-20240618.asc
          keyid: 66D1 5FDD 8728 7219 C8E1  5478 D200 CD70 2853 E6D0
          source: "deb https://pkgs.openbao.org/deb/ stable main"
    package_update: true
    packages:
      - openssh-client
      - openssh-server
      - openbao
      - qemu-guest-agent
    runcmd:
      - systemctl enable qemu-guest-agent
      - systemctl start qemu-guest-agent
      - systemctl enable openbao
      - systemctl start openbao
    EOF

    file_name = "openbao-cloud-init.yaml"
  }
}

resource "proxmox_download_file" "debian_cloud_image" {
  content_type = "import"
  datastore_id = "local"
  node_name    = "pve-mini-2"
  url          = "https://cloud.debian.org/images/cloud/trixie/latest/debian-13-generic-amd64.qcow2"
}

resource "proxmox_virtual_environment_vm" "openbao" {
  name                = "openbao"
  node_name           = "pve-mini-2"
  description         = "OpenBao"
  reboot_after_update = true

  started         = true
  stop_on_destroy = false
  on_boot         = true

  tablet_device = false

  cpu {
    cores   = 2
    sockets = 1
  }

  memory {
    dedicated = 4096
  }

  agent {
    enabled = true
  }

  disk {
    interface   = "virtio0"
    iothread    = true
    discard     = "on"
    size        = 20
    import_from = proxmox_download_file.debian_cloud_image.id
  }

  network_device {
    mac_address = "02:69:7E:84:A6:37" # static lease 192.168.1.127
  }

  initialization {
    ip_config {
      ipv4 {
        address = "192.168.1.46/24"
        gateway = "192.168.1.1"
      }
    }
    user_data_file_id = proxmox_virtual_environment_file.openbao-cloud-init.id
  }

  operating_system {
    type = "l26"
  }

  boot_order = ["scsi0"] # Boot from the SCSI disk
}
