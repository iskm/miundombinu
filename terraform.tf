terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.76.1"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "5.95.0"
    }

    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.51.0"
    }
  }
}

provider "aws" {
  # the AWS creds are exported into the environment
}

provider "digitalocean" {
  # the doc creds are exported into the environment
}

provider "proxmox" {
  endpoint = "https://192.168.0.100:8006/"
  insecure = true

  ssh {
    # modules interacting with vms require this option
    agent = true
  }
}
