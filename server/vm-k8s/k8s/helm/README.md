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

## OpenFaaS

Add chart repository `helm repo add openfaas https://openfaas.github.io/faas-netes/`

Go to directory `cd ./charts` and run download chart `helm pull --untar openfaas/openfaas`

Return to parent directory (where is stored this README) and install openfaas `helm upgrade openfaas --install -n openfaas ./charts/openfaas`

To retrive the admin password run: `echo $(kubectl -n openfaas get secret basic-auth -o jsonpath="{.data.basic-auth-password}" | base64 --decode)`

To access dashboard use port-forward: `kubectl port-forward -n openfaas $(kubectl get pods -n openfaas -A --selector "app=gateway" --output=name) 8080:8080`

## Tekton

Add chart repository `helm repo add cdf https://cdfoundation.github.io/tekton-helm-chart/`

Go to directory `cd ./charts` and run download chart `helm pull --untar cdf/tekton-pipeline`

Create namespaces `kubectl apply -f ../static-yaml/namespaces.yaml`

Return to parent directory (where is stored this README) and install tekton `helm upgrade tekton --install -n tekton ./charts/tekton-pipeline -f tekton-values.yml`

Install tekton dashboard - `kubectl apply -f ../static-yaml/tekton-dashboard-full-v0.53.0.yaml`.
[Source of this file](https://storage.googleapis.com/tekton-releases/dashboard/previous/v0.53.0/release-full.yaml)

## pihole

Add chart repository `helm repo add mojo2600 https://mojo2600.github.io/pihole-kubernetes/`

Go to directory `cd ./charts` and run download chart `helm pull mojo2600/pihole --untar`

Return to parent directory (where is stored this README) and install pihole `helm install -n pihole pihole ./charts/pihole -f pihole-values.yml`

To upgrade replace install with upgrade command.

## Knative

Add chart repository `helm repo add knative-operator https://knative.github.io/operator`

Go to directory `cd ./charts` and run download chart `helm pull knative-operator/knative-operator --untar`

Return to parent directory (where is stored this README) and install pihole `helm install -n knative-operator --create-namespace knative-operator ./charts/knative-operator`

To upgrade replace install with upgrade command.

To show chart configuration `helm show values -n knative-operator knative-operator/knative-operator`

## Troubleshooting

### Dump K8s resources

`helm install --dry-run --debug <the_remaining_arguments_used_during_install_stage>`

### Chart wyświetl wszystkie konfigurowalne opcje

`helm show values <path/to/chart>`
