#!/bin/bash

samplefile="demo.txt"

if [ ! -f "$samplefile" ]; then
    echo "Error: File '$samplefile' does not exist."
    exit 1
fi

sed -n '2,3p' "$samplefile"
