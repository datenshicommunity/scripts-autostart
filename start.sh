#!/bin/bash
# Script Start
for config in $(smug list); do
  smug start "$config" --detach
done
echo 'Completed'
