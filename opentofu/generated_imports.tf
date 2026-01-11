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
        address = "dhcp"
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
        address = "dhcp"
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
        address = "dhcp"
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
        address = "dhcp"
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
        address = "dhcp"
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
        address = "dhcp"
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
        address = "dhcp"
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
        address = "dhcp"
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
        address = "dhcp"
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
        address = "dhcp"
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
        address = "dhcp"
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
        address = "dhcp"
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
        address = "dhcp"
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
        address = "dhcp"
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
    enabled      = true
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
    enabled      = true
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
