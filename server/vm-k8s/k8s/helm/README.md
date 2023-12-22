# Helm charts

## Fluent Bit

Add chart repository `helm repo add fluent https://fluent.github.io/helm-charts`

Go to directory `cd ./charts` and run download chart `helm pull fluent/fluent-bit --untar`

Return to parent directory (where is stored this README) and install fluent-bit `helm install -n monitoring fluent-bit ./charts/fluent-bit -f fluent-bit-values.yml`
