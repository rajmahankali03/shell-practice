#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ];  # Check if the user ID is not equal to 0 (root user)
then
    echo "Error: You are not root user, please run as root"
    exit 1 # Exit the script with an error code if not root
    else
    echo "You are root user, proceeding with installation"
fi

VALIDATE() {
    if [ $1 -eq 0 ]; then
        echo "installation of $2 successful"
    else
        echo "$2 installation failed"
        exit 1 # Exit with an error code if installation fails
    fi

    dnf list installed mysql
    if [ $? -ne 0 ]
    then
        echo "MySQL is not installed, proceeding with installation"
        dnf install mysql -y
       VALIDATE $? "mysql"
    else 
        echo "MySQL is already installed"
        
    fi

    dnf list installed python3
    if [ $? -ne 0 ]
    then
        echo "python3 is not installed, proceeding with installation"
        dnf install python3 -y
       VALIDATE $? "python3"
    else 
        echo "python3 is already installed"
        
    fi

    dnf list installed nginx
    if [ $? -ne 0 ]
    then
        echo "nginx is not installed, proceeding with installation"
        dnf install nginx -y
       VALIDATE $? "nginx"
    else 
        echo "nginx is already installed"
        
    fi       
}