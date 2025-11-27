terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.78.1"
    }
  }
}

provider "aws" {
  # the AWS creds are exported into the environment
}

provider "digitalocean" {
  # the doc creds are exported from the environment DIGITALOCEAN_TOKEN="XXXX"
}

provider "proxmox" {
  endpoint = "https://192.168.0.100:8006/"
  insecure = true

  ssh {
    # modules interacting with vms require this option
    agent = true
  }
}
