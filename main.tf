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

  node_name = each.value.node_name
  name      = each.key

  cpu_cores = each.value.cpu_cores
  cpu_units = each.value.cpu_units

  memory_dedicated = each.value.memory_dedicated
  memory_floating  = each.value.memory_floating

  efi_datastore  = each.value.efi_datastore
  disk_datastore = each.value.disk_datastore
  disk_size      = each.value.disk_size

  network_mac = each.value.network_mac

  ha_enabled = lookup(each.value, "ha_enabled", false)
}

resource "proxmox_virtual_environment_vm" "vm" {
  node_name     = "pve-01"
  name          = "nas-test"
  description   = "Managed by OpenTofu"
  on_boot       = true
  scsi_hardware = "virtio-scsi-single"
  bios          = "ovmf"
  boot_order    = ["scsi0", "ide3"]

  agent {
    enabled = true
  }

  cpu {
    cores = 6
    type  = "x86-64-v2-AES"
    numa  = true
    units = 100
  }

  memory {
    dedicated = 16384
    floating  = 16384
  }

  efi_disk {
    datastore_id = "pve-storage"
  }

  cdrom {
    file_id = "local:iso/nixos-install.iso"
  }

  disk {
    datastore_id = "pve-storage"
    size         = "20"
    file_format  = "raw"
    interface    = "scsi0"
    iothread     = true
  }

  disk {
    datastore_id = "pve-storage"
    size         = "20"
    file_format  = "raw"
    interface    = "scsi1"
    iothread     = true
  }

  disk {
    datastore_id = "pve-storage"
    size         = "2"
    file_format  = "raw"
    interface    = "scsi2"
    iothread     = true
  }

  disk {
    datastore_id = "pve-storage"
    size         = "2"
    file_format  = "raw"
    interface    = "scsi3"
    iothread     = true
  }

  disk {
    datastore_id = "pve-storage"
    size         = "2"
    file_format  = "raw"
    interface    = "scsi4"
    iothread     = true
  }

  disk {
    datastore_id = "pve-storage"
    size         = "2"
    file_format  = "raw"
    interface    = "scsi5"
    iothread     = true
  }

  network_device {
    bridge      = "vmbr1"
    mac_address = "BC:24:11:45:AA:27"
    model       = "virtio"
  }

  operating_system {
    type = "l26"
  }
}
