#!/bin/bash
DATE=$(date +%Y-%m-%d)
DESCRIPTION="S3 backup failed - $DATE"
URL="https://events.pagerduty.com/v2/enqueue"
INT_KEY="6cac30c4672c482e9a87b01170428ed9"

curl -H "application/json" $URL \
           -X POST \
           -d \
           "
           {
               \"routing_key\": \"${INT_KEY}\",
               \"event_action\": \"trigger\",
               \"payload\": {
                   \"summary\": \"${DESCRIPTION}\",
                   \"source\": \"OpenShift S3 Backup\",
                   \"severity\": \"warning\"
                   }
            }"