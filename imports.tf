import {
  to = aws_lightsail_instance.ubuntu_22_virginia
  id = "Ubuntu-22-virginia"
}

resource "aws_lightsail_instance" "ubuntu_22_virginia" {
  name              = "Ubuntu-22-virginia"
  availability_zone = "us-east-1a"
  bundle_id         = "small_3_0"
  blueprint_id      = "ubuntu_22_04"
  key_pair_name     = "aws_ubuntu_virginia"

}

import {
  to = proxmox_virtual_environment_vm.rhel0
  id = "pve/110"
}

resource "proxmox_virtual_environment_vm" "rhel0" {
  node_name = "pve"
  name      = "rhel0"

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
    type  = "x86-64-v2-AES"
  }

  scsi_hardware = "virtio-scsi-single"

}

import {
  to = proxmox_virtual_environment_vm.docker0
  id = "pve/101"
}

resource "proxmox_virtual_environment_vm" "docker0" {
  node_name = "pve"
  name      = "docker0"

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
    type  = "x86-64-v2-AES"
  }

  scsi_hardware = "virtio-scsi-single"

}

## 

import {
  to = proxmox_virtual_environment_vm.node0
  id = "pve/103"
}

resource "proxmox_virtual_environment_vm" "node0" {
  node_name = "pve"
  name      = "node0"

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
    type  = "x86-64-v2-AES"
  }

  scsi_hardware = "virtio-scsi-single"

}

##

import {
  to = proxmox_virtual_environment_vm.node1
  id = "pve/104"
}

resource "proxmox_virtual_environment_vm" "node1" {
  node_name = "pve"
  name      = "node1"

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
    type  = "x86-64-v2-AES"
  }

  scsi_hardware = "virtio-scsi-single"

}

##

import {
  to = proxmox_virtual_environment_vm.node2
  id = "pve/105"
}

resource "proxmox_virtual_environment_vm" "node2" {
  node_name = "pve"
  name      = "node2"

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
    type  = "x86-64-v2-AES"
  }

  scsi_hardware = "virtio-scsi-single"

}

##

import {
  to = proxmox_virtual_environment_vm.node3
  id = "pve/106"
}

resource "proxmox_virtual_environment_vm" "node3" {
  node_name = "pve"
  name      = "node3"

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
    type  = "x86-64-v2-AES"
  }

  scsi_hardware = "virtio-scsi-single"

}


##

import {
  to = proxmox_virtual_environment_vm.node4
  id = "pve/107"
}

resource "proxmox_virtual_environment_vm" "node4" {
  node_name = "pve"
  name      = "node4"

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
    type  = "x86-64-v2-AES"
  }

  scsi_hardware = "virtio-scsi-single"

}

##

import {
  to = proxmox_virtual_environment_vm.node5
  id = "pve/108"
}

resource "proxmox_virtual_environment_vm" "node5" {
  node_name = "pve"
  name      = "node5"

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
    type  = "x86-64-v2-AES"
  }

  scsi_hardware = "virtio-scsi-single"

}
