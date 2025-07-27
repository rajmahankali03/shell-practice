#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ];  # Check if the user ID is not equal to 0 (root user)]
then
    echo "Error: You are not root user, please run as root"
    exit 1 # Exit the script with an error code if not root
    else
    echo "You are root user, proceeding with installation"
fi
