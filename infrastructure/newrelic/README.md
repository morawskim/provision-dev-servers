# New Relic and Terraform

A Terraform script which addes infrastructure alerting to New Relic.

## Usage

1. You need copy `env.dist` to `.env` and change values for variables `NEW_RELIC_ACCOUNT_ID` and `NEW_RELIC_API_KEY`.
1. Call `tofu init`
1. Load a coppied env file - `. .env`
1. Call `tofu apply`

## ENV variables

The file `vault.yml` is encrypted via ansible-vault.
Use passphrase to decrypt this file and see values for variables `passphrase`, `NEW_RELIC_ACCOUNT_ID` and `NEW_RELIC_API_KEY` for new relic.

## Apply changes

`NEW_RELIC_ACCOUNT_ID=accountId NEW_RELIC_API_KEY=apiKey TF_VAR_passphrase=mypassword tofu apply`
