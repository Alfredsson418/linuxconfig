#!/bin/bash

status=$(mullvad status | cut -d "" -f 1 | head -n 1)

if [[ "$status" == "Disconnected" ]]; then
    state="disconnected"
elif [[ "$status" == "Connected" ]]; then
    state="connected"
else
    state="err"
fi

echo "{\"text\":\"${status}\",\"tooltip\":\"\",\"alt\":\"${state}\",\"class\":\"${state}\"}"
