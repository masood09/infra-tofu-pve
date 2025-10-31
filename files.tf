resource "proxmox_virtual_environment_download_file" "nixos_iso" {
  content_type            = "iso"
  datastore_id            = var.pve_download_file_datastore_id
  node_name               = var.pve_node_name

  file_name               = "nixos-masood-install.iso"
  url                     = "https://github.com/masood09/nix/releases/download/v0.1.0/nixos.iso"
  overwrite               = false
}
