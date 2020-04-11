# USAGE

We use bolt to run ours scirpts.
`bolt` is not a direct dependency of this repo.
You should run `bundle init` to create `Gemfile`.
And then install `bolt` by run command `bundle add bolt`.

[Bolt docs](https://puppet.com/docs/bolt/latest/bolt.html)

Show all defined targets `bolt inventory show -t '*'`

Show details of target: `bolt inventory show -t <TARGET> --detail`

## nginx-vhost-proxy

`bundle exec bolt script run --targets sensi-srv90 ./nginx-vhost-proxy.sh  '<HOSTNAME eg. rc.ssorder.snlb.pl>' 'http://192.168.15.28'`

To enable SSL and use Let's Encrypt free SSL/TLS certificates run command:
`sudo certbot --non-interactive --agree-tos -m tomasz.zalewski@sensilabs.pl --nginx --redirect -d <DOMAIN_NAME eg. developer.ssorder.snlb.pl>`
You can do run it command by `bolt`.

`bundle exec bolt command run "sudo certbot --non-interactive --agree-tos -m tomasz.zalewski@sensilabs.pl --nginx --redirect -d <DOMAIN_NAME>" --targets sensi-srv28`
