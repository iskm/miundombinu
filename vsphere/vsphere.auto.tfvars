## cluster variables for vanilla_k8s
k8s_nodes = {
  node0 = {
    ipv4   = "192.168.0.101"
    cpu    = 4
    memory = 16384
  }
  node1 = {
    ipv4   = "192.168.0.103"
    cpu    = 6
    memory = 24476

  }
  node2 = {
    ipv4   = "192.168.0.105"
    cpu    = 6
    memory = 24476

  }
}

## cluster variables for k3s
k3s_nodes = {
  node3 = {
    ipv4   = "192.168.0.106"
    cpu    = 2
    memory = 8092
  }
  node4 = {
    ipv4   = "192.168.0.107"
    cpu    = 4
    memory = 16384

  }
  node5 = {
    ipv4   = "192.168.0.108"
    cpu    = 4
    memory = 16384

  }
}

## variables for windows_core
windows_core = {
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
