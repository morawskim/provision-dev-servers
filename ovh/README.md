## Manage DNS

The goal of this ansible playbook is manage DNS' records.
[ansible-ovh-dns module](https://github.com/gheesh/ansible-ovh-dns) is used to manage DNS records via OVH DNS API.
You need to have ovh application and all necessary keys.
Check configuration of ansible-ovh-dns module to know how to create those keys.

You can also clone repo [morawskim/ovh-domain](https://github.com/morawskim/ovh-domain) and [edit file](https://github.com/morawskim/ovh-domain/blob/master/src/Commands/DomainCredential.php) to setup oauth.
You need to change permission configuration.
