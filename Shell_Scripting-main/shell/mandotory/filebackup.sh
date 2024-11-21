#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <file_to_remove>"
    exit 1
fi

file_to_remove=$1

backup_dir="/home/user1/backup"

if [ ! -f "$file_to_remove" ]; then
    echo "Error: File '$file_to_remove' does not exist."
    exit 1
fi

if [ ! -d "$backup_dir" ]; then
    mkdir -p "$backup_dir"
fi

cp "$file_to_remove" "$backup_dir"

if [ $? -eq 0 ]; then
    echo "Backup of '$file_to_remove' created in '$backup_dir'."
    
    rm "$file_to_remove"
    
    if [ $? -eq 0 ]; then
        echo "File '$file_to_remove' has been successfully removed."
    else
        echo "Error: Failed to remove '$file_to_remove'."
    fi
else
    echo "Error: Failed to create backup of '$file_to_remove'."
fi
