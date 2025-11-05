proxmox_vms = {
  pve-proxy = {
    node_name        = "pve-01"

    cpu_cores        = 1
    cpu_units        = 25

    memory_dedicated = 4096
    memory_floating  = 4096

    efi_datastore    = "pve-ceph-pool"
    disk_datastore   = "pve-ceph-pool"
    disk_size        = "20"

    network_mac    = "BC:24:11:35:5B:13"
  }

  pve-database = {
    node_name        = "pve-02"

    cpu_cores        = 1
    cpu_units        = 25

    memory_dedicated = 4096
    memory_floating  = 4096

    efi_datastore    = "pve-ceph-pool"
    disk_datastore   = "pve-ceph-pool"
    disk_size        = "50"

    network_mac      = "BC:24:11:DD:EB:43"
  }

  pve-monitoring = {
    node_name        = "pve-03"

    cpu_cores        = 1
    cpu_units        = 25

    memory_dedicated = 4096
    memory_floating  = 4096

    efi_datastore    = "pve-ceph-pool"
    disk_datastore   = "pve-ceph-pool"
    disk_size        = "20"

    network_mac      = "BC:24:11:32:3D:70"
  }

  pve-nix-builder = {
    node_name        = "pve-03"

    cpu_cores        = 6
    cpu_units        = 100

    memory_dedicated = 8192
    memory_floating  = 8192

    efi_datastore    = "pve-storage"
    disk_datastore   = "pve-storage"
    disk_size        = "20"

    network_mac      = "BC:24:11:D4:FE:BF"

    ha_enabled       = false
  }

  pve-app-1 = {
    node_name        = "pve-01"

    cpu_cores        = 1
    cpu_units        = 25

    memory_dedicated = 4096
    memory_floating  = 4096

    efi_datastore    = "pve-ceph-pool"
    disk_datastore   = "pve-ceph-pool"
    disk_size        = "20"

    network_mac      = "bc:24:11:ed:9b:fe"
  }
}
