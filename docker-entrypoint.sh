#!/bin/bash

#
# main entry point to run backup cron job
#

S3CMD_CONFIG=/root/.s3cfg
cp /app/.s3cfg $S3CMD_CONFIG
echo "" >> "$S3CMD_CONFIG"
echo "access_key=${S3_ACCESS_KEY_ID}" >> "$S3CMD_CONFIG"
echo "secret_key=${S3_SECRET_ACCESS_KEY}" >> "$S3CMD_CONFIG"
echo "gpg_passphrase=${S3_PASSPHRASE}" >> "$S3CMD_CONFIG"
echo "" >> "$S3CMD_CONFIG"

CRONTAB_FILE=/etc/cron.d/backup-cron/crontab

echo "0 ${BACKUP_HOUR:-0} * * * root . /root/project_env.sh; . /app/backup.sh" > "$CRONTAB_FILE"
echo "" >> "$CRONTAB_FILE"

printenv | sed 's/^\(.*\)$/export \1/g' > /root/project_env.sh

cron -f
