#!/bin/bash
# create the configuration file
CMDDIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
PYTHONPATH=${APP_ROOT}/ecscli/
sed "s|ACCESS_KEY|${AWS_ACCESS_KEY}|g" ${CMDDIR}/s3cfg.tmpl | \
  sed "s|SECRET_KEY|${AWS_SECRET_KEY}|g" | \
  sed "s|HOST_BASE|${HOST_BASE}|g" |
  sed "s|BUCKET_NAME|${BUCKET_NAME}|g" \
  > ${CMDDIR}/s3cfg
${APP_ROOT}/ecscli/bin/s3cmd -c ${CMDDIR}/s3cfg  mb s3://"${BUCKET_NAME}" 
${APP_ROOT}/ecscli/bin/s3cmd -c ${CMDDIR}/s3cfg sync $1 s3://${BUCKET_NAME}
