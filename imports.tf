import {
  to = aws_lightsail_instance.ubuntu_22_virginia
  id = "Ubuntu-22-virginia"
}

resource "aws_lightsail_instance" "ubuntu_22_virginia" {
  name = "Ubuntu-22-virginia"  
  availability_zone = "us-east-1a"
  bundle_id = "small_3_0"
  blueprint_id = "ubuntu_22_04"
  key_pair_name = "aws_ubuntu_virginia"

}

import {
  to = proxmox_virtual_environment_vm.rhel0
  id = "pve/110" 
}

resource "proxmox_virtual_environment_vm" "rhel0" {
  node_name = "pve"
  name = "rhel0"

  agent {
    enabled = true
  }

  stop_on_destroy = true

  memory {
    dedicated = 8192
  }

  operating_system {
    type = "l26"
  }

  cpu {
    cores = 2
    type = "x86-64-v2-AES"
  }

  scsi_hardware  = "virtio-scsi-single"

}

import {
  to = proxmox_virtual_environment_vm.docker0
  id = "pve/101" 
}

resource "proxmox_virtual_environment_vm" "docker0" {
  node_name = "pve"
  name = "docker0"

  agent {
    enabled = true
  }

  stop_on_destroy = true

  memory {
    dedicated = 8192
  }

  operating_system {
    type = "l26"
  }

  cpu {
    cores = 2
    type = "x86-64-v2-AES"
  }

  scsi_hardware  = "virtio-scsi-single"

}

