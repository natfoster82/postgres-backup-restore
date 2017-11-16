#!/bin/sh -e

#
# main entry point to run s3cmd
#
S3CMD_CONFIG=/root/.s3cfg

#
# Check for required parameters
#
if [ -z "${S3_ACCESS_KEY_ID}" ]; then
    echo "ERROR: The environment variable key is not set."
    exit 1
fi

if [ -z "${S3_SECRET_ACCESS_KEY}" ]; then
    echo "ERROR: The environment variable secret is not set."
    exit 1
fi
#
# Set user provided key and secret in .s3cfg file
#
echo "" >> "$S3CMD_CONFIG"
echo "access_key=${S3_ACCESS_KEY_ID}" >> "$S3CMD_CONFIG"
echo "secret_key=${S3_SECRET_ACCESS_KEY}" >> "$S3CMD_CONFIG"

#
# Finished operations
#
echo "Finished s3cmd operations"