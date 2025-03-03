#!/bin/sh

function archive () {
    local source_dir=$1
    local dest_dir=$2
    local label=${3:-"full"}

    # Check if the source and destination directories are provided
    if [ -z "$source_dir" ] || [ -z "$dest_dir" ] || [-z "$label" ]; then
        echo "Usage: archive <source_directory> <destination_directory> <label>"
        return 1
    fi

    zip -r "${dest_dir}"/backup-$(date +%Y%m%d)-${label}.zip "${source_dir}"
}

archive "$@"