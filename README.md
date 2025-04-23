Make sure your `PROXMOX_VE_USERNAME` and `PROXMOX_VE_PASSWORD` are set in your
environment. The `PROXMOX_VE_USERNAME` is in the format `USERNAME@pam` or
`USERNAME@pve` depending on how you set up your node

## Imports using bpg/proxmox provider
Importing VMs into terraform destroys them then recreates. Stay away from its
import feature
