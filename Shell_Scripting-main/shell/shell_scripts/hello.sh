#!/bin/bash

read -p "Enter a string: " input_string

for ((i=1; i<=${#input_string}; i++))
do
    echo "${input_string:0:i}"
done

# Enter a string: Hello
# H
# He
# Hel
# Hell
# Hello