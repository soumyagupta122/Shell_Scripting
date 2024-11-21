#!/bin/bash

echo -n "Enter the login name to check: "
read login_name

if who | grep -q "^$login_name"; then
    echo "The user '$login_name' is currently logged in."
else
    echo "The user '$login_name' is not logged in."
fi
