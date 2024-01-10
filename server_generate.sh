#!/bin/bash

if [[ -z "$XRAY_MAC_UUID" || -z "$XRAY_IPHONE_UUID" ]]; then
  echo "Environment variables XRAY_MAC_UUID and XRAY_SERVER_UUID must be set."
  exit 1
fi

server_template=$(cat server_template.json)
output=${server_template//"%XRAY_MAC_UUID%"/$XRAY_MAC_UUID}
output=${output//"%XRAY_IPHONE_UUID%"/$XRAY_IPHONE_UUID}
echo "$output" > server.json && echo "server.json generated"

cp server.json /usr/local/etc/xray/config.json \
&& echo "cp server.json to /usr/local/etc/xray/config.json success" \
&& systemctl restart xray && systemctl status xray
