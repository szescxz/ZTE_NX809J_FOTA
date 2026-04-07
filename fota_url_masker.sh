#!/bin/bash

if [ "$GITHUB_ACTIONS" == "true" ]; then
    export FOTA_URL="$(jq -r '.inputs.url' $GITHUB_EVENT_PATH)"
fi
SENSITIVE_PART_1=$(echo "$FOTA_URL" | grep -Po '/ZTE/.+/\K([0-9]+)')
echo ::add-mask::$SENSITIVE_PART_1
SENSITIVE_PART_2=$(echo "$FOTA_URL" | grep -Po '/ZTE/.+/([0-9]+)/\K.+?(?=GEN_)')
echo ::add-mask::$SENSITIVE_PART_2
