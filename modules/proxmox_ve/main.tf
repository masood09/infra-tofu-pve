resource "proxmox_virtual_environment_vm" "vm" {
  node_name        = var.node_name
  name             = var.name
  description      = "Managed by OpenTofu"
  tags             = var.tags
  on_boot          = var.on_boot
  scsi_hardware    = var.scsi_hardware
  bios             = var.bios
  boot_order       = var.boot_order

  agent {
    enabled = true
  }

  cpu {
    cores = var.cpu_cores
    type  = var.cpu_type
    numa  = var.cpu_numa
    units = var.cpu_units
  }

  memory {
    dedicated = var.memory_dedicated
    floating  = var.memory_floating
  }

  efi_disk {
    datastore_id = var.efi_datastore
  }

  cdrom {
    file_id = "pve-nas-storage:iso/nixos-install.iso"
  }

  disk {
    datastore_id = var.disk_datastore
    size         = var.disk_size
    file_format  = "raw"
    interface    = var.disk_interface
    iothread     = true
  }

  network_device {
    bridge      = var.network_bridge
    mac_address = var.network_mac
    model       = "virtio"
  }

  operating_system {
    type = "l26"
  }
}

resource "proxmox_virtual_environment_haresource" "vm" {
  count       = var.ha_enabled ? 1 : 0
  resource_id = "vm:${proxmox_virtual_environment_vm.vm.vm_id}"
  state       = "started"
  comment     = "Managed by OpenTofu"
}
