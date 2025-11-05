variable "node_name" { default = "pve-01" }
variable "name" {}
variable "description" { default = "Managed by OpenTofu" }
variable "tags" {
  type    = list(string)
  default = [ "nixos", "opentofu" ]
}
variable "on_boot" {
  type    = bool
  default = true
}
variable "scsi_hardware" { default = "virtio-scsi-single" }
variable "bios" { default = "ovmf" }
variable "boot_order" {
  type = list(string)
  default = ["scsi0", "ide3"]
}

variable "cpu_cores" { default = 1 }
variable "cpu_type" { default = "x86-64-v2-AES" }
variable "cpu_numa" { default = true }
variable "cpu_units" { default = 25 }

variable "memory_dedicated" { default = 2048 }
variable "memory_floating" { default = 2048 }

variable "efi_datastore" { default = "pve-ceph-pool" }
variable "disk_datastore" { default = "pve-ceph-pool" }
variable "disk_size" { default = "20" }
variable "disk_interface" { default = "scsi0" }

variable "network_bridge" { default = "vmbr1" }
variable "network_mac" {}

variable "iso_datastore_id" { default = "pve-nas-storage" }

variable "ha_enabled" {
  type    = bool
  default = true
}
