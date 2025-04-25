Make sure your `PROXMOX_VE_USERNAME` and `PROXMOX_VE_PASSWORD` are set in your
environment. The `PROXMOX_VE_USERNAME` is in the format `USERNAME@pam` or
`USERNAME@pve` depending on how you set up your node

To use `aws` provider make sure an `AWS_ACCESS_KEY_ID` and
`AWS_SECRET_ACCESS_KEY` is setup in your environment, or set up via the `aws
configure`


## Cautions

1. Importing VMs into terraform destroys them then recreates. Stay away from its
import feature

2. Add as many information (including optional) of the VMs you are importing to
   reduce chance of recreation. This is true for aws lightsail

3. DNS record changes take a while to reflect. Make sure to account for it

## FAQs

## ROADMAP TO FULLY PROGRAMMABLE INFRA
1. add namecheap/namecheap provider
2. kickoff configuration after provisioning(awx callbacks?)
3. in conjuction with 3 separate the data from compute
4. Migrate doc droplet into azure/gcps/aws(pending decision)
5. Integrate terraform into CI/CD pipeline
6. Central secrets management via CI/CD(Github Actions) pipeline
7. Central state management via syncthing

