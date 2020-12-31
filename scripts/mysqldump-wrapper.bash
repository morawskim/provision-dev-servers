#!/bin/bash
#===============================================================================
#
#          FILE: mysqldump-wrapper.bash
#
#         USAGE: ./mysqldump-wrapper.bash OUTPUT_FILE -- mysqldump arguments
#                ./mysqldump-wrapper.bash /tmp/dump.sql.gz -- -uroot --databases databasename
#                ./mysqldump-wrapper.bash /proc/self/fd/1 -- -uroot --databases databasename | zless
#                systemd-cat -t mysqldump-dbname /path/to/mysqldump-wrapper.bash /root/dump-$(date '+\%F').sql.gz -- -uroot --databases dbname
#
#   DESCRIPTION: Dump mysql database(s) using mysqldump and gzip
#
#       OPTIONS: ---
#  REQUIREMENTS: mysqldump, gzip
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Marcin Morawski (marcin@morawskim.pl)
#  ORGANIZATION:
#       CREATED: 30.12.2020 14:35
#      REVISION: 1
#===============================================================================


set -euo pipefail -o noclobber

function displayUsage() {
    echo "Missing seperator" >&2
    echo "$0 OUTPUT_FILE -- mysqldump_arguments" >&2
    exit 1
}

if [ $# -lt 3 ]; then
    displayUsage
fi

OUTPUT_FILE=$1
SEPERATOR=$2
shift 2

if [ "$SEPERATOR" != "--" ]; then
    displayUsage
fi

# mysqldump additional arguments like  --databases, -u etc.
MYSQLDUMP_ARGUMENTS=$@

umask 066
/usr/bin/mysqldump --single-transaction --quick --skip-lock-tables --routines $MYSQLDUMP_ARGUMENTS | gzip > $OUTPUT_FILE
