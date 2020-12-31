#!/bin/bash
set -euo pipefail -o noclobber

# directory to put the backup files
BACKUP_DIR=${BACKUP_DIR:-~/backups}

# MYSQL Parameters
MYSQL_USERNAME=${MYSQL_USERNAME:-root}
MYSQL_PWD=${MYSQL_PWD:-''}
# databases seperated by space
DATABASES=$@

#YYYY-MM-DD-h_m_s
TIMESTAMP=$(date '+%F-%H_%M_%S')

for database in $DATABASES; do
    output_file="$BACKUP_DIR/$database-$TIMESTAMP.sql.gz"
    echo "Dumping database $database to $output_file using mysql account: ${MYSQL_USERNAME}."
    MYSQL_PWD=$MYSQL_PWD /usr/bin/mysqldump --single-transaction --quick --skip-lock-tables --routines --databases $database -u$MYSQL_USERNAME | gzip > $output_file
done
