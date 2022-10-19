#!/bin/bash
# Script Start
for config in $(smug list | sort); do
  smug start "$config" --detach
done
sleep 3

# Minecraft start
. config/global.config

if [[ -z $mcpanelserverid ]]; then
  echo "Ignoring MC auto start." >&2
else
  curl \
    -H "Accept: application/json" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $mcpaneltoken" \
    -X POST \
    -d '{"signal": "start"}' \
    "https://panel.datenshi.pw/api/client/servers/$mcpanelserverid/power"
fi
sleep 3

# Send to Discord
curl -X POST --data '{"content": "`[SERVER]` All-server has been started! <@176829603321610240>"}' --header "Content-Type:application/json" $webhookDC

echo 'Completed'
