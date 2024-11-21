#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file_to_remove>"
    exit 1
fi

file_to_remove="$1"

if [ ! -f "$file_to_remove" ]; then
    echo "Error: The file '$file_to_remove' does not exist."
    exit 1
fi

backup_dir="/home/user1/backup"
if [ ! -d "$backup_dir" ]; then
    echo "Backup directory '$backup_dir' does not exist. Creating it now."
    mkdir -p "$backup_dir"
fi

cp "$file_to_remove" "$backup_dir"

if [ $? -eq 0 ]; then
    echo "Backup of '$file_to_remove' created in '$backup_dir'."
else
    echo "Error occurred while creating backup."
    exit 1
fi

rm "$file_to_remove"

if [ $? -eq 0 ]; then
    echo "File '$file_to_remove' removed successfully."
else
    echo "Error occurred while removing the file."
    exit 1
fi
