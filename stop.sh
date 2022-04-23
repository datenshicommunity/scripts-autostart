#!/bin/bash
# Script stop
for config in $(smug list); do
  smug stop "$config"
done
sleep 3

# Minecraft stop
. config/global.config

if [[ -z $mcpanelserverid ]]; then
  echo "Ignoring MC auto stop." >&2
else
  curl \
    -H "Accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $mcpaneltoken" \
    -X POST \
    -b "pterodactyl_session=$mcpanelcookies"  \
    -d '{"signal": "stop"}' \
    "https://panel.datenshi.pw/api/client/servers/$mcpanelserverid/power"
fi
sleep 3

# Send to Discord
curl -X POST --data '{"content": "`[SERVER]` All-server has been stopped! <@176829603321610240>"}' --header "Content-Type:application/json" $webhookDC

echo 'Completed'
