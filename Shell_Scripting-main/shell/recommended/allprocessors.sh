#!/bin/bash

# Display all processes grouped by name, without the header line
ps aux | tail -n +2 | awk '{print $11}' | sort | uniq -c | sort -nr

