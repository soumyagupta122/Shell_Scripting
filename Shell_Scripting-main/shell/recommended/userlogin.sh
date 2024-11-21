#!/bin/bash

username="user1"

user_count=$(who | grep -w "$username" | wc -l)

if [ "$user_count" -eq 0 ]; then
    echo "No users logged in as '$username'."
else
    echo "Number of users logged in as '$username': $user_count"
fi
