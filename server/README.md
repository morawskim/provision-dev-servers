## Disaster recovery

### Tiny Tiny RSS

#### Restore database from dump

`zcat <file/with/backup.sql.gz> | docker exec -i <CONTAINER> /usr/bin/mysql -uroot --password=<rootPassword> -D<DATABASE>`

### Nextcloud

#### Restore database from dump
`zcat <file/with/backup.sql.gz> | docker exec -i <CONTAINER> /usr/bin/mysql -uroot --password=<rootPassword> -D<DATABASE>`

#### Restore data:

```
docker cp nextcloud.tar.gz nextcloud_app_1:/var/www/html
docker exec nextcloud_app_1 tar xzf /var/www/html/nextcloud.tar.gz
docker exec -uwww-data nextcloud_app_1 php occ maintenance:data-fingerprint
```
