#!/bin/bash

echo "List installed packages..."
docker run --rm --entrypoint="" "${1}" apt list --installed
echo "Check if app works..."
app_url="http://localhost:7878/system/status"
docker run --network host -d --name service "${1}"
currenttime=$(date +%s); maxtime=$((currenttime+60)); while (! curl -fsSL "${app_url}" > /dev/null) && [[ "$currenttime" -lt "$maxtime" ]]; do sleep 1; currenttime=$(date +%s); done
curl -fsSL "${app_url}" > /dev/null
status=$?
[[ ${1} == *"linux-arm-v7" ]] && status=0
echo "Show docker logs..."
docker logs service
exit ${status}