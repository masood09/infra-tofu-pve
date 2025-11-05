variable "pve_conn_endpoint" { default = "https://pve-01.mgmt.homelab.mantannest.com:8006/" }
variable "pve_conn_api_token" {}

variable "proxmox_vms" {
  description = "Map of VM configurations for Proxmox"
  type = map(any)
}
