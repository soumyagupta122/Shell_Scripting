#!/bin/bash

current_user=$(whoami)

user_sessions=$(who | grep -w "$current_user" | wc -l)

if [ "$user_sessions" -gt 1 ]; then
    echo "Duplicate login detected for user '$current_user'. Logging out in 5 seconds..."
    sleep 5
    
    duplicate_pid=$(who | grep -w "$current_user" | awk 'NR>1 {print $2}' | xargs -I {} ps -eo pid,tty,user | grep -w "{}" | awk '{print $1}')
    
    if [ -n "$duplicate_pid" ]; then
        kill -9 $duplicate_pid
        echo "Duplicate session for '$current_user' has been terminated."
    else
        echo "Error: Could not find the duplicate session for user '$current_user'."
    fi
else
    echo "No duplicate login for user '$current_user'."
fi
