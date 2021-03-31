## Disaster recovery

### Restore database from dump

`zcat <file/with/backup.sql.gz> | docker exec -i <CONTAINER> /usr/bin/mysql -uroot --password=<rootPassword> -D<DATABASE>`
