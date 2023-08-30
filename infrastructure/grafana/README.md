# Grafana and Terraform

A Terraform script to manage Grafana.

## Usage

1. Call `terraform init`
1. Call `GRAFANA_AUTH=yourToken terraform apply -var-file=aws.tfvars`

To get token, log-in to grafana panel and from left menu hover on the gear icon and select "API keys".

## Integration with AWS CLoudWatch

[Centralize AWS observability with Grafana Cloud](https://grafana.com/blog/2023/08/29/centralize-aws-observability-with-grafana-cloud/)
