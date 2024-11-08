#!/bin/bash

while getopts "p:s:" opt; do
    case $opt in
        p) DIR_PATH="$OPTARG" ;;
        s) SEARCH_TEXT="$OPTARG" ;;
        *) 
           echo "Використання: $0 -p <шлях до директорії> -s <текст для пошуку>"
           exit 1
           ;;
    esac
done

if [ -z "$DIR_PATH" ] || [ -z "$SEARCH_TEXT" ]; then
    echo "Використання: $0 -p <шлях до директорії> -s <текст для пошуку>"
    exit 1
fi

if [ ! -d "$DIR_PATH" ]; then
    echo "Помилка: Директорія $DIR_PATH не знайдена."
    exit 1
fi

grep -rl "$SEARCH_TEXT" "$DIR_PATH"
