#!/bin/bash

echo "Files in the current directory:"
files=(*)

if [ ${#files[@]} -eq 0 ]; then
    echo "No files found in the current directory."
    exit 1
fi

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "$file"
    fi
done

max_file=""
min_file=""
max_size=0
min_size=$(stat -c %s "${files[0]}")

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        file_size=$(stat -c %s "$file")

        if [ $file_size -gt $max_size ]; then
            max_size=$file_size
            max_file=$file
        fi

        if [ $file_size -lt $min_size ]; then
            min_size=$file_size
            min_file=$file
        fi
    fi
done

if [ -n "$max_file" ] && [ -n "$min_file" ]; then
    echo "File with maximum size: $max_file ($max_size bytes)"
    echo "File with minimum size: $min_file ($min_size bytes)"
else
    echo "No regular files found in the current directory."
fi
