#!/bin/bash

if [[ -z "$XRAY_MAC_UUID" ]]; then
  echo "Environment variables XRAY_MAC_UUID and XRAY_SERVER_UUID must be set."
  exit 1
fi

client_template=$(cat client_template.json)
output=${client_template//"%XRAY_MAC_UUID%"/$XRAY_MAC_UUID}
echo "$output" > client.json && echo "client.json generated"
