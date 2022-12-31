# k8s

## Instalation

First we need to manually create a repository in github. The repoisitory should be already initialized so we must check the checkbox "Add a README file".
Next we have to create a [Fine-grained personal access tokens](https://github.com/settings/tokens?type=beta) (at the moment this feature is in beta phrase) for created repository.
On the page we select Read and Write permissions for "Contents" and "Administration".
We need [contents permission](https://docs.github.com/en/rest/overview/permissions-required-for-fine-grained-personal-access-tokens?apiVersion=2022-11-28#contents), because we need to commit files created via terraform during process of instalation fluxcd in Kubernetes cluster.
The [administration permissions](https://docs.github.com/en/rest/overview/permissions-required-for-fine-grained-personal-access-tokens?apiVersion=2022-11-28#administration) are necessary, because we need to add the deploy key.

Now we need to export variables `export TF_VAR_github_owner=<your-github-username>` and `export TF_VAR_github_token=<value-of-the-created-token>`.

Then we need to install terraform providers - `terraform init` and then we can apply changes `terraform apply`.
When finished we can return to github repository and ensure that the deployment key has been created and a new commits has been appeared.

## Flux cheatsheet

Install flux - `curl -s https://fluxcd.io/install.sh | sudo bash`

See flux logs  - `flux logs`

## kubeseal - simple example

Create kubernetes secret resource or use following command to generate secret template with key "foo" and value "bar" - `echo -n bar | kubectl create secret generic mysecret --dry-run=client --from-file=foo=/dev/stdin -o yaml >mysecret.yaml`.

When you open the file `mysecret.yaml` you should see encoded value for "foo" - `foo: YmFy`.

Next create sealed secret - `kubeseal --format yaml <mysecret.yaml > mysealedsecret.yaml`

And apply resource - `kubectl apply -f mysealedsecret.yaml`

Finally you can check the decoded value of secret from cluster - `kubectl get secret mysecret -o jsonpath='{.data.foo}' | base64 --decode`
