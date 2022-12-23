This repository contains infrastructure as code.
The goal of this repo is setup and manage configuration of SaaS applications (Sentry, GitLab, New Relic, Mailgun, Grafana) and raw infrastructure (OVH, KVM/libvirt, AWS).

The structure of this repository is split in three main directories - intrastructure, servers and workstation.

### Infrastructure directory

The directory `infrastructure` contains terraform files for:
* setup project and alerts in Senty
* assign gitlab-runners to projects in GitLab
* manage projects in GitLab
* manage deployment keys in GitLab
* setup virtual machines
* manage DNS zone in OVH
* manage alerts in New Relic
* manage resources in AWS (S3, budget, IAM)
* manage email accounts in Mailgun
* manage dashboards in Grafana

### Server directory

The directory `servers` contains ansible playbook, which configure virtual machines.

The vm-gitlab playbook install and configure gitlab-runner, which can be used in lieu of GitLab's shared runners.

The vm-docker playbook install and configure docker with applications.

### Workstation directory

Ansible playbooks in workstation directory are used to setup and maintain configuration of workstations.

## Vagrant env

1. vagrant up
1. vagrant ssh tumbleweed
1. git clone https://github.com/morawskim/provision-dev-servers.git
1. ssh-keyscan leap.local >> ~/.ssh/known_hosts
1. cd ~/provision-dev-servers/server
1. make deploy-nuc-vagrant
1. cd ~/provision-dev-servers/infrastructure/kvm/vagrant/
1. make setup
1. terraform init
1. make vagrant-apply

Now you can connect to vm. Open a new terminal go to dir to which you cloned this repository and type `make vagrant-ssh-jump VM=<vm-name>` to connect to virtual machine.
At the moment only docker and gitlab are allowed as `vm-name`.
Also you might need to wait few seconds to connect to vm (vm machine need be booted).
