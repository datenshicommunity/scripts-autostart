#!/bin/bash
# Script stop
for config in $(smug list); do
  smug stop "$config"
done
echo 'Completed'
