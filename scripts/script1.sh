#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Використання: $0 <шлях до директорії> <розширення>"
    exit 1
fi

DIR_PATH=$1
EXTENSION=$2

if [ ! -d "$DIR_PATH" ]; then
    echo "Помилка: Директорія $DIR_PATH не знайдена."
    exit 1
fi

find "$DIR_PATH" -type f -name "*.$EXTENSION"

