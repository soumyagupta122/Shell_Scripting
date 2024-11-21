#!/bin/bash

samplefile="samplefile"

if [ ! -f "$samplefile" ]; then
    echo "Error: File '$samplefile' does not exist."
    exit 1
fi

# Display all lines except the last one
head -n -1 "$samplefile"
