# Helm charts

## Fluent Bit

Add chart repository `helm repo add fluent https://fluent.github.io/helm-charts`

Go to directory `cd ./charts` and run download chart `helm pull fluent/fluent-bit --untar`

Return to parent directory (where is stored this README) and install fluent-bit `helm install -n monitoring fluent-bit ./charts/fluent-bit -f fluent-bit-values.yml`

To upgrade replace install with upgrade command.

## kube-state-metrics

Add chart repository - `helm repo add prometheus-community https://prometheus-community.github.io/helm-charts`

Go to directory `cd ./charts` and download chart `helm pull --untar prometheus-community/kube-state-metrics`

Return to parent directory (where is stored this README) and install kube-state-metrics `helm install -n monitoring kube-state-metrics ./charts/kube-state-metrics -f kube-state-metrics-values.yml`

## Troubleshooting

### Dump K8s resources

`helm install --dry-run --debug <the_remaining_arguments_used_during_install_stage>`

### Chart wyświetl wszystkie konfigurowalne opcje

`helm show values <path/to/chart>`
