## ENV variables

The file `vault.yml` is encrypted via ansible-vault.
Use passphrase to decrypt this file and see values for variables `passphrase` and `CLOUDAMQP_APIKEY` for CloudAMQP.

To generate apikey go to [API Access](https://customer.cloudamqp.com/apikeys)

## Apply changes

`TF_VAR_passphrase=mypassword CLOUDAMQP_APIKEY=apikey tofu apply`
