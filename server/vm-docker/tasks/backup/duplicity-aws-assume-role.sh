#!/usr/bin/env bash

set -euo pipefail

function displayUsage() {
    echo "Missing required arguments" >&2
    echo "$0 AWS_ROLE_ARN -- duplicity-command-with-arguments" >&2
    exit 1
}

if [ $# -lt 4 ]; then
    displayUsage
fi

ROLE_ARN=$1
SEPERATOR=$2
shift 2

if [ "$SEPERATOR" != "--" ]; then
    displayUsage
fi

GPG_KEY=$2
SOURCE_DIR=$3
DESTINATION=$4

export $(printf "AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s" \
$(aws sts assume-role \
--role-arn $ROLE_ARN \
--role-session-name 'duplicity-backup' \
--query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" \
--output text))

COMMAND=$@
echo $COMMAND

$COMMAND
