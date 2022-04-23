#!/bin/bash
# Script stop
for config in $(smug list); do
  smug stop "$config"
done
# Minecraft stop
# Config
source config/global.config

sleep 3

curl "$mcpanel/api/client/servers/$mcpanelserverid/power" \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -H 'Authorization: Bearer $mcpaneltoken' \
  -X POST \
  -b 'pterodactyl_session'='$mcpanelcookies' \
  -d '{"signal": "stop"}'

sleep 3

curl -X POST --data '{"content": "`[SERVER]` All-server has been stopped! <@176829603321610240>"}' --header "Content-Type:application/json" $webhookDC

echo 'Completed'
