#!/bin/bash

echo -n "Enter the file name: "
read file_name

echo -n "Enter the number of lines to display (x): "
read x

if [ ! -f "$file_name" ]; then
    echo "Error: File '$file_name' does not exist."
    exit 1
fi

if [ ! -r "$file_name" ]; then
    echo "Error: File '$file_name' is not readable."
    exit 1
fi

total_lines=$(wc -l < "$file_name")

if [ "$x" -gt "$total_lines" ]; then
    echo "Error: The value of x ($x) exceeds the total number of lines in the file ($total_lines)."
    exit 1
fi

echo "Displaying the first $x lines of '$file_name':"
head -n "$x" "$file_name"
