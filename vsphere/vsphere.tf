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
