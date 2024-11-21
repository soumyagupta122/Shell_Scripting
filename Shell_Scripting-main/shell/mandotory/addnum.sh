#!/bin/bash

sum=0

for number in "$@"; do
    sum=$((sum + number))
done

echo "The sum of the numbers is: $sum"
