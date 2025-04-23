terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.76.1"
    }
  }
}

provider "proxmox" {
  endpoint = "https://192.168.0.100:8006/"
  insecure = true
}
