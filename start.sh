#!/bin/bash
# Script Start
for config in $(smug list); do
  smug start "$config" --detach
done
sleep 3

# Minecraft start
# Config
source config/global.config

curl "$mcpanel/api/client/servers/$mcpanelserverid/power" \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -H 'Authorization: Bearer $mcpaneltoken' \
  -X POST \
  -b 'pterodactyl_session'='$mcpanelcookies' \
  -d '{"signal": "start"}'

sleep 3

curl -X POST --data '{"content": "`[SERVER]` All-server has been started! <@176829603321610240>"}' --header "Content-Type:application/json" $webhookDC

echo 'Completed'
