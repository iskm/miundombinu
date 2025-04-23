import {
  to = proxmox_virtual_environment_vm.rhel0
  id = "pve/110" 
}

resource "proxmox_virtual_environment_vm" "rhel0" {
  node_name = "pve"
}
