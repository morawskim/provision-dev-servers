## Info

This repository contains infrastructure as code.
The goal of this repo is setup and manage configuration of SaaS applications (Sentry, GitLab, New Relic) and raw infrastructure (OVH, KVM/libvirt).

The structure of this repository is split in three main directories - intrastructure, servers and workstation.

### Infrastructure directory

The directory `infrastructure` contains terraform files for:
* setup project an alerts in Senty
* assign gitlab-runners to projects in GitLab
* manage deployment keys in GitLab
* setup virtual machines
* manage DNS zone in OVH

### Server directory

The directory `servers` contains ansible playbook, which configure virtual machines.

The vm-gitlab playbook install and configure gitlab-runner, which can be used in lieu of GitLab's shared runners.

The vm-docker playbook install and configure docker with applications.

## Workstation directory

Ansible playbooks in workstation directory are used to setup and maintain configuration of workstations.
