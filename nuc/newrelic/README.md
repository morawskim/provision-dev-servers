# New Relic and Terraform

A Terraform script which addes infrastructure alerting to New Relic.

## Usage

1. You need copy `env.dist` to `.env` and change values for variables `NEW_RELIC_ACCOUNT_ID` and `NEW_RELIC_API_KEY`.
1. Call `terraform init`
1. Load a coppied env file - `. .env`
1. Call `terraform apply`
