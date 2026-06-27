#!/bin/bash

echo "========================================="
echo "        User Management Script"
echo "========================================="

echo "1. Create User"
echo "2. Delete User"
echo "3. List Users"
echo "4. Exit"

echo
read -p "Choose an option (1-4): " option

case $option in

1)
    read -p "Enter Username: " username

    if id "$username" &>/dev/null
    then
        echo " User already exists."
    else
        sudo useradd "$username"
        echo " User '$username' created successfully."
    fi
    ;;

2)
    read -p "Enter Username: " username

    if id "$username" &>/dev/null
    then
        sudo userdel "$username"
        echo " User '$username' deleted successfully."
    else
        echo " User does not exist."
    fi
    ;;

3)
    echo
    echo "System Users:"
    cut -d: -f1 /etc/passwd
    ;;

4)
    echo "Exiting..."
    exit 0
    ;;

*)
    echo "Invalid Option."
    ;;

esac

echo
echo "========================================="
echo "User Management Completed"
echo "========================================="
