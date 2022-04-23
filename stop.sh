#!/bin/bash
# Script stop
for config in $(smug list); do
  smug stop "$config"
done
# Minecraft stop
# Config
source minecraft.config

sleep 3

curl "$mcpanel/api/client/servers/$mcpanelserverid/power" \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -H 'Authorization: Bearer $mcpaneltoken' \
  -X POST \
  -b 'pterodactyl_session'='$mcpanelcookies' \
  -d '{"signal": "stop"}'
echo 'Completed'
