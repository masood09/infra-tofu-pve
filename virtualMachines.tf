resource "proxmox_virtual_environment_vm" "pve_server_1" {
  node_name        = var.pve_node_name
  name             = "pve-server-1" 
  description      = "Managed by OpenTofu"
  tags             = ["opentofu", "nixos", "server"]
  on_boot          = true
  scsi_hardware    = "virtio-scsi-single"
  bios             = "ovmf"
  boot_order       = ["scsi0", "ide3", "net0"]

  agent {
    enabled = true
  }

  cpu {
    cores = 6
    type  = "x86-64-v2-AES"
    numa  = true
  }

  memory {
    dedicated = 16384 
    floating  = 16384
  }

  efi_disk {
    datastore_id = var.pve_ceph_disk_storage 
  }

  cdrom {
    file_id      = proxmox_virtual_environment_download_file.nixos_iso.id
  }

  disk {
    datastore_id = var.pve_ceph_disk_storage
    size         = "100"
    file_format  = "raw"
    interface    = "scsi0"
    iothread     = true
  }

  network_device {
    bridge      = "vmbr1"
    mac_address = "BC:24:11:0F:64:60"
    model       = "virtio"
  }

  operating_system {
    type = "l26"
  }
}

resource "proxmox_virtual_environment_haresource" "pve_server_1" {
  resource_id  = "vm:${proxmox_virtual_environment_vm.pve_server_1.vm_id}"
  state        = "started"
  comment      = "Managed by OpenTofu"
}
