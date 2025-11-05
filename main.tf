terraform {
  required_version = ">= 1.7.0"

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.64.0"
    }
  }
}

provider "proxmox" {
  endpoint  = var.pve_conn_endpoint
  api_token = var.pve_conn_api_token
  insecure  = false

  ssh {
    agent       = false
    username    = "root"
    private_key = file("~/.ssh/id_ed25519")
  }
}

module "proxmox_vms" {
  source   = "./modules/proxmox_ve"
  for_each = var.proxmox_vms

  providers = {
    proxmox = proxmox
  }

  node_name        = each.value.node_name
  name             = each.key

  cpu_cores        = each.value.cpu_cores
  cpu_units        = each.value.cpu_units

  memory_dedicated = each.value.memory_dedicated
  memory_floating  = each.value.memory_floating

  efi_datastore    = each.value.efi_datastore
  disk_datastore   = each.value.disk_datastore
  disk_size        = each.value.disk_size

  network_mac      = each.value.network_mac

  ha_enabled       = lookup(each.value, "ha_enabled", true)
}
