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

resource "proxmox_virtual_environment_vm" "trialunit" {
  node_name     = "pve-01"
  name          = "trialunit"
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
    file_id = "local:iso/nixos.iso"
  }

  disk {
    datastore_id = "pve-storage"
    size         = "50"
    file_format  = "raw"
    interface    = "scsi0"
    iothread     = true
  }

  disk {
    datastore_id = "pve-storage"
    size         = "50"
    file_format  = "raw"
    interface    = "scsi1"
    iothread     = true
  }

  disk {
    datastore_id = "pve-storage"
    size         = "10"
    file_format  = "raw"
    interface    = "scsi2"
    iothread     = true
  }

  disk {
    datastore_id = "pve-storage"
    size         = "10"
    file_format  = "raw"
    interface    = "scsi3"
    iothread     = true
  }

  disk {
    datastore_id = "pve-storage"
    size         = "10"
    file_format  = "raw"
    interface    = "scsi4"
    iothread     = true
  }

  disk {
    datastore_id = "pve-storage"
    size         = "10"
    file_format  = "raw"
    interface    = "scsi5"
    iothread     = true
  }

  disk {
    datastore_id = "pve-storage"
    size         = "10"
    file_format  = "raw"
    interface    = "scsi6"
    iothread     = true
  }

  disk {
    datastore_id = "pve-storage"
    size         = "10"
    file_format  = "raw"
    interface    = "scsi7"
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
