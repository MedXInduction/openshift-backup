#!/bin/bash

# create the configuration file

sed "s|ACCESS_KEY|${AWS_ACCESS_KEY}|g" s3cfg.tmpl | \
  sed "s|SECRET_KEY|${AWS_SECRET_KEY}|g" | \
  sed "s|HOST_BASE|${HOST_BASE}|g" |
  sed "s|BUCKET_NAME|${BUCKET_NAME}|g" \
  > s3cfg
s3cmd -c s3cfg  mb s3://"${BUCKET_NAME}" 
s3cmd -c s3cfg sync $1 s3://${BUCKET_NAME}
