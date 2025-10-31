variable "pve_conn_endpoint" {
  type    = string
  default = "https://pve-01.mgmt.homelab.mantannest.com:8006/"
}

variable "pve_conn_api_token" {
  type = string
}

variable "pve_conn_insecure" {
  type    = bool
  default = false
}

variable "pve_download_file_datastore_id" {
  type    = string
  default = "pve-nas-storage"
}

variable "pve_local_disk_storage" {
  type    = string
  default = "pve-storage"
}

variable "pve_ceph_disk_storage" {
  type    = string
  default = "pve-ceph-pool"
}

variable "pve_node_name" {
  type    = string
  default = "pve-01"
}
