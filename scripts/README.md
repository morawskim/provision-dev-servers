# USAGE

We use bolt to run ours scirpts.
`bolt` is not a direct dependency of this repo.
You should run `bundle init` to create `Gemfile`.
And then install `bolt` by run command `bundle add bolt`.

[Bolt docs](https://puppet.com/docs/bolt/latest/bolt.html)

## nginx-vhost-proxy

`bundle exec bolt script run --targets sensi-srv90 ./nginx-vhost-proxy.sh  '<HOSTNAME eg. rc.ssorder.snlb.pl>' 'http://192.168.15.28'`
