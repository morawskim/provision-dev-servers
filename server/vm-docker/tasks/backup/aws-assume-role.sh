#!/usr/bin/env bash

set -euo pipefail

function displayUsage() {
    echo "Missing required arguments" >&2
    echo "$0 AWS_ROLE_ARN -- duplicity-command-with-arguments" >&2
    exit 1
}

if [ $# -lt 3 ]; then
    displayUsage
fi

ROLE_ARN=$1
SEPERATOR=$2
shift 2

if [ "$SEPERATOR" != "--" ]; then
    displayUsage
fi

export $(printf "AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s" \
$(aws sts assume-role \
--role-arn $ROLE_ARN \
--role-session-name 'duplicity-backup' \
--duration-seconds 7200 \
--query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" \
--output text))

COMMAND=$@
echo $COMMAND

$COMMAND
