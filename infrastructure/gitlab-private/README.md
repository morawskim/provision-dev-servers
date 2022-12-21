# Gitlab

This repo does not contain terraform state files to prevent leak of private key which is used to sign RPM packages.

## rpm-pipeline project

First create a GPG key (RSA (sign only)) - `gpg --full-gen-key`
Chech that key has been created - `gpg --list-keys` or `gpg -k`. In the output we should see a new GPG key.
Next export public key - `gpg --export -a 'KEY_ID' > RPM-GPG-KEY` and private key - `gpg -o ci.key --armor --export-secret-keys KEY_ID`. The filename of private key is important, because terraform expect a file with excatly this name. The terraform script will add env variable (`GPG_PRIVATE_KEY_TO_SIGN`) to project, so Gitlab CI/CD will able to sign RPM package.

## Apply changes

Create GPG key (see instruction for rpm-pipeline project)

`terraform init`

`GITLAB_TOKEN=<token-from-gitlab> terraform apply`
