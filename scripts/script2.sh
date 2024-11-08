#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Використання: $0 <шлях до директорії> <текст для пошуку>"
    exit 1
fi

DIR_PATH=$1
SEARCH_TEXT=$2

if [ ! -d "$DIR_PATH" ]; then
    echo "Помилка: Директорія $DIR_PATH не знайдена."
    exit 1
fi

grep -rl "$SEARCH_TEXT" "$DIR_PATH"
