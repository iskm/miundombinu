terraform {
  required_providers {
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
