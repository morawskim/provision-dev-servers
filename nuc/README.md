# intel-nuc

## Vagrant

1. `vagrant up`
1. `vagrant ssh`
1. `git clone https://github.com/morawskim/provision-dev-servers.git`
1. `cd provision-dev-servers/nuc/terraform/`
1. `make setup`
1. `make vagrant-setup-kvm`
1. `terraform init`
1. Adjust libvirt uri value in `main.tf`. Add/Remove/Modify other terraform files.
1. `make vagrant-apply`
1. Check IP of vagrant server `ip a s eth1`
1. Open a new tab in terminal and connect to vm running in vagrant `ssh -J vagrant@<VAGRANT_IP> ubuntu@<VM_IP_EG_192.168.111.10>`.

## Deploy

```
cd terraform
make setup
terraform init
terraform apply
cd ..
make deploy-docker
```

## Disaster recovery

### Tiny Tiny RSS

#### Restore database from dump

`zcat <file/with/backup.sql.gz> | docker exec -i <CONTAINER> /usr/bin/mysql -uroot --password=<rootPassword> -D<DATABASE>`
