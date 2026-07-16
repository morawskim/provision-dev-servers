# Ansible Role: Automatic Package Update

An Ansible role that configures automatic package updates and notification relay on Debian and RedHat based systems.

Features
--------

- **MTA Configuration**: Installs and configures `msmtp` to handle local mail delivery.
- **Notification Relay**: Installs `gosmtp` to relay local emails to notification services (using the `shoutrrr` library).
- **Unattended Upgrades**: (Debian only) Configures `unattended-upgrades` to automatically install security and package updates.

Role Variables
--------------

The following variables are defined in `vars/main.yml`:

| Variable | Default Value | Description |
|----------|---------------|-------------|
| `notification_url` | `'this is secret value'` | The shoutrrr notification URL used by gosmtp to relay emails (e.g., telegram, slack, etc.). |
| `msmtp_package_map` | (OS mapping) | Dictionary mapping OS families to `msmtp` package names. |
| `gosmtp_package_url` | (OS mapping) | Dictionary mapping OS families to `gosmtp` package download URLs. |
| `additional_repository_origins` | `[]` | (Debian only) List of additional repository origins to allow in `unattended-upgrades`. |

Example Playbook
----------------

```yaml
---
- hosts: all
  become: true
  roles:
    - name: automaticPackageUpdate
      vars:
        notification_url: "telegram://BBBBBBBB:AAAA@telegram?chats=-XXXXXXXX&preview=No"

```

Verification
------------

You can test the mail configuration using:
```bash
echo "test mail" | sendmail -v root@example.com
```
