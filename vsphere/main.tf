provider "vsphere" {
  user                 = var.vcsa_user
  password             = var.vcsa_password
  vsphere_server       = var.vcsa_address
  allow_unverified_ssl = true
  api_timeout          = 10

}

data "vsphere_datacenter" "datacenter" {
  name = "homelab"

}

data "vsphere_host" "primary" {
  name          = "esx.homelab.test"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "datastore" {
  name          = "containervms"
  datacenter_id = data.vsphere_datacenter.datacenter.id

}


data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = data.vsphere_datacenter.datacenter.id

}

data "vsphere_virtual_machine" "template" {
  name          = "debian-template"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "docker" {
  name             = "docker0"
  resource_pool_id = data.vsphere_host.primary.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = 4
  memory           = 16384
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  folder           = "docker"
  #wait_for_guest_net_timeout = 0
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  disk {
    label = "disk0"
    size  = data.vsphere_virtual_machine.template.disks.0.size
    #thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
    # must be explicit with some options otherwise it will trip terraform
    thin_provisioned = true
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = "docker0"
        domain    = "homelab.test"
      }
      network_interface {
        ipv4_address = "192.168.0.104"
        ipv4_netmask = 24
      }
      ipv4_gateway    = "192.168.0.1"
      dns_server_list = ["192.168.0.202"]
      dns_suffix_list = ["homelab.test"]
    }
  }

}
