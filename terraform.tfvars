proxmox_vms = {
  pve-proxy = {
    node_name        = "pve-01"

    cpu_cores        = 6
    cpu_units        = 100

    memory_dedicated = 4096
    memory_floating  = 4096

    efi_datastore    = "pve-storage"
    disk_datastore   = "pve-storage"
    disk_size        = "20"

    network_mac    = "BC:24:11:35:5B:13"
  }

  pve-database = {
    node_name        = "pve-01"

    cpu_cores        = 6
    cpu_units        = 100

    memory_dedicated = 4096
    memory_floating  = 4096

    efi_datastore    = "pve-storage"
    disk_datastore   = "pve-storage"
    disk_size        = "50"

    network_mac      = "BC:24:11:DD:EB:43"
  }

  pve-monitoring = {
    node_name        = "pve-01"

    cpu_cores        = 6
    cpu_units        = 100

    memory_dedicated = 4096
    memory_floating  = 4096

    efi_datastore    = "pve-storage"
    disk_datastore   = "pve-storage"
    disk_size        = "20"

    network_mac      = "BC:24:11:32:3D:70"
  }

  pve-app-1 = {
    node_name        = "pve-01"

    cpu_cores        = 6
    cpu_units        = 100

    memory_dedicated = 4096
    memory_floating  = 4096

    efi_datastore    = "pve-storage"
    disk_datastore   = "pve-storage"
    disk_size        = "20"

    network_mac      = "bc:24:11:ed:9b:fe"
  }
}
