# source:
# https://registry.terraform.io/providers/bpg/proxmox/latest/docs/guides/cloud-init
data "local_file" "ssh_public_key" {

  filename = "./resources/id_rsa.pub"
}


resource "proxmox_virtual_environment_file" "user_data_cloud_config" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = "pve"
  source_file {
    path = "./scripts/user-data-cloud-config.yaml"
  }

  /*  source_raw {*/
  /*data = <<-EOF*/
  /*#cloud-config*/
  /*hostname: node */
  /*timezone: America/Toronto*/
  /*users:*/
  /*- name: ubuntu*/
  /*groups:*/
  /*- sudo*/
  /*shell: /bin/bash*/
  /*ssh_authorized_keys:*/
  /*- ${trimspace(data.local_file.ssh_public_key.content)}*/
  /*sudo: ALL=(ALL) NOPASSWD:ALL*/
  /*package_update: true*/
  /*packages:*/
  /*- qemu-guest-agent*/
  /*- net-tools*/
  /*- curl*/
  /*runcmd:*/
  /*- systemctl enable qemu-guest-agent*/
  /*- systemctl start qemu-guest-agent*/
  /*- echo "done" > /tmp/cloud-config.done*/
  /*EOF*/

  /*file_name = "user-data-cloud-config.yaml"*/
  /*}*/
}

resource "proxmox_virtual_environment_vm" "debian_vm" {
  name      = "test-ubuntu"
  node_name = "pve"

  agent {
    enabled = true
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 2048
  }

  initialization {
    ip_config {
      ipv4 {
        #address = "192.168.0.113/24"
        #gateway = "192.168.0.1"
        address = "dhcp"
      }
    }

    /*user_account {*/
    /*username = "ubuntu"*/
    /*keys  = [trimspace(data.local_file.ssh_public_key.content)]*/
    /*}*/
    user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id
  }

  disk {
    datastore_id = "local-lvm"
    file_id      = proxmox_virtual_environment_download_file.debian_cloud_image.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 20

  }



  network_device {
    bridge = "vmbr0"
  }
}


resource "proxmox_virtual_environment_download_file" "debian_cloud_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "pve"
  file_name    = "debian-12-generic-amd64-20231228-1609.img"
  #url = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
  url                 = "http://cloud.debian.org/images/cloud/bookworm/20250530-2128/debian-12-generic-amd64-20250530-2128.qcow2"
  overwrite_unmanaged = true
}
