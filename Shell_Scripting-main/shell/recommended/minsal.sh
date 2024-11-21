#!/bin/bash

samplefile="samplefile"

if [ ! -f "$samplefile" ]; then
    echo "Error: File '$samplefile' does not exist."
    exit 1
fi

awk '$3 != "Clerk" { print $0 }' "$samplefile" | sort -k5 -n | head -n 1
