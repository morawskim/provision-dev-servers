# Setup workstation for Kubuntu 24.04 LTS

1. Install `ansible` - `sudo apt-get install ansible`
1. Install required ansible collection `sudo ansible-galaxy collection install community.general`
1. Execute `sudo ansible-playbook ./playbook.yml`
1. Execute `ansible-playbook ./playbook-marcin.yml`
1. Execute `vim` and run command `:PlugInstall` to install plugins
1. Execute `yadm clone url-to-dotfile-repository`


## Update kwinscript

1. List installed scripts `plasmapkg2 -l --type=kwinscript`
```
Listing service types: KWin/Script in /home/marcin/.local/share/kwin/scripts/
ultrawidewindows
```

2. Remove installed script `plasmapkg2 --type kwinscript -r ultrawidewindows`

3. Run anisble playbook
