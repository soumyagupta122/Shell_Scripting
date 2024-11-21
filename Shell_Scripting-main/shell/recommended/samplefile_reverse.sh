#!/bin/bash

samplefile="demo.txt"

if [ ! -f "$samplefile" ]; then
    echo "Error: File '$samplefile' does not exist."
    exit 1
fi

tac "$samplefile"
