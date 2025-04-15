#!/bin/bash

status=$(mullvad status | cut -d "" -f 1 | head -n 1)

if [[ "$status" == "Disconnected" ]]; then
    mullvad connect
else
    mullvad disconnect
fi

exit 0
