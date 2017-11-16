#!/bin/bash

#
# main entry point to run s3cmd
#
S3CMD_CONFIG=/root/.s3cfg

if [ ! -e $S3CMD_CONFIG ]; then
    cp /app/.s3cfg $S3CMD_CONFIG
    echo "" >> "$S3CMD_CONFIG"
    echo "access_key=${S3_ACCESS_KEY_ID}" >> "$S3CMD_CONFIG"
    echo "secret_key=${S3_SECRET_ACCESS_KEY}" >> "$S3CMD_CONFIG"
    echo "gpg_passphrase=${S3_PASSPHRASE}" >> "$S3CMD_CONFIG"
    printenv | sed 's/^\(.*\)$/export \1/g' > /root/project_env.sh
fi

cron -f
