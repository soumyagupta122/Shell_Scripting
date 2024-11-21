#!/bin/bash

output_file="output.txt"

if [ -f "$output_file" ]; then
    rm "$output_file"
fi

for file in *; do

    if [ -f "$file" ]; then

        cat "$file" >> "$output_file"

        echo -e "\n\n--- End of $file ---\n" >> "$output_file"
    fi
done

echo "All regular files have been copied to '$output_file'."
