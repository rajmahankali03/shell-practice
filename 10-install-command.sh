#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0]
then
    echo "You are not root user, please run as root"
    exit 1
    else
    echo "You are root user, proceeding with installation"
fi
