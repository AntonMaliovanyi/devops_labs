#!/bin/bash

LAST_MOD_FILE="D:/qweasd/var/log/my-app.log"
LOG_FILE="D:/qweasd/var/log/my-app.log"
STATUS_FILE="D:/qweasd/qwe.txt"

if [ ! -f "$LOG_FILE" ]; then
    echo "Log file not found: $LOG_FILE"
    exit 1
fi

current_mod_time=$(stat -c %Y "$LOG_FILE")
current_size=$(stat -c %s "$LOG_FILE")

if [ -f "$LAST_MOD_FILE" ]; then
    last_mod_time=$(cat "$LAST_MOD_FILE")
    if ! [[ "$last_mod_time" =~ ^[0-9]+$ ]]; then
        last_mod_time=0
    fi
else
    last_mod_time=0
fi

if [ "$current_mod_time" -ne "$last_mod_time" ]; then
    echo "$current_mod_time" > "$LAST_MOD_FILE"
    echo "{\"log_file_size\": $current_size, \"log_file_mod_time\": $current_mod_time}" > "$STATUS_FILE"
fi
