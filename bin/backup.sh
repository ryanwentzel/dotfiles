#!/bin/sh

backup() {
    local src=$1
    local dest=$2

    if [ -z "$src" ] || [ -z "$dest" ]; then
        echo "Usage: backup <source_directory> <destination_directory>"
        return 1
    fi

    rsync -av --exclude=".DS_Store" --delete "${src}" "${dest}"
}

backup "$@"