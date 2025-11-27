resource "digitalocean_project" "kwerezigua_org" {
  name        = "kwerezigua.org"
  description = "Manage all services at www.kwerezigua.org"
  purpose     = "homelab"
  environment = "Development"
  is_default  = true
}


resource "digitalocean_ssh_key" "authorized_key" {
  name       = "authorized_key"
  public_key = file("resources/id_rsa.pub")
}
