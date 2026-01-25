## cluster variables for vanilla_k8s
variable "k8s_nodes" {
  description = "instance information for kubernetes nodes"
  type        = map(any)
  default = {
    node0 = {
      ipv4   = "192.168.0.101"
      cpu    = 4
      memory = 8092
    }
    node1 = {
      ipv4   = "192.168.0.103"
      cpu    = 6
      memory = 24476

    }
    node2 = {
      ipv4   = "192.168.0.106"
      cpu    = 6
      memory = 24476

    }
  }
}

variable "k3s_nodes" {
  description = "instance information for k3s nodes"
  type        = map(any)
  default = {
    node3 = {
      ipv4   = "192.168.0.106"
      cpu    = 4
      memory = 8092
    }
    node4 = {
      ipv4   = "192.168.0.107"
      cpu    = 6
      memory = 24476

    }
    node5 = {
      ipv4   = "192.168.0.107"
      cpu    = 6
      memory = 24476

    }
  }
}

variable "windows_core" {
  description = "instance information for windows_core vms"
  type        = map(any)
  default = {
    windows0 = {
      ipv4   = "192.168.0.15"
      cpu    = 4
      memory = 8092
    }
    windows1 = {
      ipv4   = "192.168.0.16"
      cpu    = 2
      memory = 4096

    }
    windows2 = {
      ipv4   = "192.168.0.17"
      cpu    = 4
      memory = 16384

    }
  }
}
