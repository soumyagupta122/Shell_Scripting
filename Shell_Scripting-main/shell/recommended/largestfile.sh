#!/bin/bash

if [ -z "$(ls -p | grep -v /)" ]; then
    echo "No files found in the current directory."
    exit 1
fi

largest_file=$(ls -S | head -n 1)
largest_file_size=$(stat -c %s "$largest_file")

echo "Largest file: $largest_file"
echo "Size: $largest_file_size bytes"
