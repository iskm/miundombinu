data "proxmox_virtual_environment_vms" "all_vms" {

}

resource "proxmox_virtual_environment_apt_standard_repository" "nosubscription" {
  # retrieve standard info from provider
  handle = "no-subscription"
  node = "pve"
}

resource "proxmox_virtual_environment_apt_standard_repository" "subscription" {
  # retrieve standard info from provider
  handle = "enterprise"
  node = "pve"
}

resource "proxmox_virtual_environment_apt_repository" "enterprise" {
  # disable the enterprise repository
  enabled = false
  file_path = proxmox_virtual_environment_apt_standard_repository.subscription.file_path
  index = proxmox_virtual_environment_apt_standard_repository.subscription.index
  node = proxmox_virtual_environment_apt_standard_repository.subscription.node
}

resource "proxmox_virtual_environment_apt_repository" "nosubscription" {
  # homelab use - stick with the no-subscription repository
  enabled = true
  file_path = proxmox_virtual_environment_apt_standard_repository.nosubscription.file_path
  index = proxmox_virtual_environment_apt_standard_repository.nosubscription.index
  node = proxmox_virtual_environment_apt_standard_repository.nosubscription.node
}
