#!/bin/bash

userid=$(id -u)

if [ $userid -ne 1001 ];  # Check if the user ID is not equal to 0 (root user)]
then
    echo "You are not root user, please run as root"
    exit 1
    else
    echo "You are root user, proceeding with installation"
fi
