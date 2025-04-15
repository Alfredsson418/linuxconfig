#!/bin/bash

status=$(mullvad status | cut -d "" -f 1 | head -n 1)
place=$(mullvad status | cut -d " " -f 2 | head -n 1)

if [[ "$status" == "Disconnected" ]]; then
    state="disconnected"
else
    state="connected"
fi

echo "{\"text\":\"${status}\",\"tooltip\":\"\",\"alt\":\"${state}\",\"class\":\"${state}\"}"
