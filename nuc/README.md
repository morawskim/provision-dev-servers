# intel-nuc

## Deploy

```
cd terraform
make setup
terraform init
terraform apply
cd ..
make deploy-docker
```

## Disaster recovery

### Tiny Tiny RSS

#### Restore database from dump

`zcat <file/with/backup.sql.gz> | docker exec -i <CONTAINER> /usr/bin/mysql -uroot --password=<rootPassword> -D<DATABASE>`
