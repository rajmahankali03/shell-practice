#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ];  # Check if the user ID is not equal to 0 (root user)
then
    echo "Error: You are not root user, please run as root"
    exit 1 # Exit the script with an error code if not root
    else
    echo "You are root user, proceeding with installation"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySQL is not installed, proceeding with installation"
        dnf install mysql -y
        if [ $? -eq 0 ]; then
            echo "Installation successful"
        else
            echo "Installation failed"
            exit 1 # Exit with an error code if installation fails
        fi
    else 
    echo "MySQL is already installed"
    echo "No need to install again"
    exit 0 # Exit with success code if already installed

fi