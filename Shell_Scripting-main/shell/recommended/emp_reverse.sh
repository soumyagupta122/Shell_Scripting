#!/bin/bash

samplefile="demo.txt"

if [ ! -f "$samplefile" ]; then
    echo "Error: File '$samplefile' does not exist."
    exit 1
fi

count=$(awk '$4 ~ /1952$/ { count++ } END { print count+0 }' "$samplefile")


echo "Number of employees who joined in 1952: $count"
