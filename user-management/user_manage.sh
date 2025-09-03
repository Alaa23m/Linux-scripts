#!/bin/bash
# ---------------------------------------------
# User Management Script
# Author: Alaa Mohamed
# Description: Interactive script to add or delete users on Linux.
# --------------------------------------------

# Function to add a user
add_user() {
    read -p "Enter the username to add: " username
    read -p "Enter the group to assign ($username will be created if not exists): " group

    # Create group if it does not exist
    if ! getent group "$group" > /dev/null; then
        echo "Group '$group' does not exist. Creating..."
        groupadd "$group"
    fi

    # Create user with home directory and assign to group
    useradd -m -g "$group" "$username"

    if [ $? -eq 0 ]; then
        echo "User '$username' created successfully and added to group '$group'."
        passwd "$username"
    else
        echo "Failed to create user '$username'."
    fi
}

# Function to delete a user
delete_user() {
    read -p "Enter the username to delete: " username

    if id "$username" &>/dev/null; then
        userdel -r "$username"
        echo "User '$username' deleted successfully."
    else
        echo "User '$username' does not exist."
    fi
}

# Main Menu
while true; do
    echo "--------------------------------------"
    echo " User Management Script"
    echo "--------------------------------------"
    echo "1. Add User"
    echo "2. Delete User"
    echo "3. Exit"
    echo "--------------------------------------"
    read -p "Choose an option [1-3]: " choice

    case $choice in
        1) add_user ;;
        2) delete_user ;;
        3) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done
