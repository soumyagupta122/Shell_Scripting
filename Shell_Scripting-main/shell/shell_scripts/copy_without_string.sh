#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: $0 <source_file> <destination_file>"
    exit 1
fi


source_file=$1
destination_file=$2


if [ ! -f "$source_file" ]; then
    echo "Error: Source file '$source_file' does not exist."
    exit 1
fi

echo "Enter the string to exclude from the source file:"
read exclude_string

> "$destination_file"


while IFS= read -r line; do
    if [[ ! "$line" =~ $exclude_string ]]; then
        echo "$line" >> "$destination_file"
    fi
done < "$source_file"


char_count=$(wc -m < "$source_file")
word_count=$(wc -w < "$source_file")
line_count=$(wc -l < "$source_file")

echo "File statistics for '$source_file':"
echo "Number of characters: $char_count"
echo "Number of words: $word_count"
echo "Number of lines: $line_count"

echo "Content has been copied to '$destination_file' excluding lines containing '$exclude_string'."

# Enter the string to exclude from the source file:
# tom
# File statistics for 'demo.txt':
# Number of characters: 198
# Number of words: 20
# Number of lines: 3
# Content has been copied to 'dest.txt' excluding lines containing 'tom'.