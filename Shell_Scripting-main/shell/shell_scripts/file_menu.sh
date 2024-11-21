#!/bin/bash

create_file() {
    read -p "Enter the name of the file to create: " filename
    if [ -e "$filename" ]; then
        echo "Error: File '$filename' already exists."
    else
        touch "$filename"
        echo "File '$filename' created successfully."
    fi
}

display_contents() {
    read -p "Enter the name of the file to display: " filename
    if [ -e "$filename" ]; then
        cat "$filename"
    else
        echo "Error: File '$filename' does not exist."
    fi
}


copy_file() {
    read -p "Enter the name of the source file: " src_file
    read -p "Enter the name of the destination file: " dest_file
    if [ -e "$src_file" ]; then
        cp "$src_file" "$dest_file"
        echo "File '$src_file' copied to '$dest_file'."
    else
        echo "Error: Source file '$src_file' does not exist."
    fi
}

rename_file() {
    read -p "Enter the name of the file to rename: " old_name
    if [ -e "$old_name" ]; then
        read -p "Enter the new name for the file: " new_name
        mv "$old_name" "$new_name"
        echo "File renamed from '$old_name' to '$new_name'."
    else
        echo "Error: File '$old_name' does not exist."
    fi
}

delete_file() {
    read -p "Enter the name of the file to delete: " filename
    if [ -e "$filename" ]; then
        rm "$filename"
        echo "File '$filename' deleted."
    else
        echo "Error: File '$filename' does not exist."
    fi
}


display_menu() {
    echo "Menu"
    echo "--------------"
    echo "1: Make a file"
    echo "2: Display contents"
    echo "3: Copy the file"
    echo "4: Rename the file"
    echo "5: Delete the file"
    echo "6: Exit"
}


while true; do

    display_menu
    
    read -p "Enter your choice (1-6): " choice
    
    case $choice in
        1)
            create_file
            ;;
        2)
            display_contents
            ;;
        3)
            copy_file
            ;;
        4)
            rename_file
            ;;
        5)
            delete_file
            ;;
        6)
            echo "Exiting the program."
            break
            ;;
        *)
            echo "Invalid choice, please try again."
            ;;
    esac
done
