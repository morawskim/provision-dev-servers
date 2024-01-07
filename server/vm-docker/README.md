## Backup

The backup is created by duplicity and send to AWS S3.
The special bash script has been created to assume role, which give a temporary access token to bucket in S3.

To restore data from backup firstly we need an account with permission to S3 bucket and GPG KEY
Call command to see files stored in bucket ` duplicity list-current-files --encrypt-key <GPG_KEY_ID>  boto3+s3://<BUCKET>/PATH/TO/BACKUP`
To see a value of GPG_KEY_ID check the file `parameters/vars.yml`.

You can restore all fiels or select only a one file (via `--path-to-restore file/from/backup` parameter) - `duplicity restore  --encrypt-key <GPG_KEY_ID>  boto3+s3://<BUCKET>/PATH/TO/BACKUP ./directory/where/restored/data/will/be/saved`

> **WARNING**: The option `--path-to-restore` has been introducted in duplicity 2.
> CommandLineError: Option '--file-to-restore was changed in 2.0.0.
>    --file-to-restore to --path-to-restore
>    --do-not-restore-ownership to --no-restore-ownership

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
