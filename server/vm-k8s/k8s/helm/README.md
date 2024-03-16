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

## Traefik

Add chart repository `helm repo add traefik https://traefik.github.io/charts`

Go to directory `cd ./charts` and run download chart `helm pull traefik/traefik --untar`

Return to parent directory (where is stored this README) and install traefik `helm install -n traefik traefik ./charts/traefik -f traefik-values.yml`

For security concerns, the dashboard is not expose by default. To access dashboard use port-forward: `kubectl port-forward -n traefik $(kubectl get pods -A --selector "app.kubernetes.io/name=traefik" --output=name) 9000:9000`.

It can then be reached at: `http://127.0.0.1:9000/dashboard/`
⚠️ The trailing "/" is very important. Otherwise you get 404.

## Troubleshooting

### Dump K8s resources

`helm install --dry-run --debug <the_remaining_arguments_used_during_install_stage>`

### Chart wyświetl wszystkie konfigurowalne opcje

`helm show values <path/to/chart>`
