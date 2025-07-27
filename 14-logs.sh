#!/bin/bash

userid=$(id -u)

R="\e[31m"  # Red
G="\e[32m"  # Green
Y="\e[33m"  # Yellow
B="\e[34m"  # Blue   
N="\e[0m"  # No color        

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" 

mkdir -P $LOG_FOLDER
echo "Script started at $(date)" $>> $LOG_FILE

if [ $userid -ne 0 ];  # Check if the user ID is not equal to 0 (root user)
then
    echo -e "$R Error: You are not root user, please run as root $N" $>> $LOG_FILE
    exit 1 # Exit the script with an error code if not root
    else
    echo -e "$G You are root user, proceeding with installation $N" $>> $LOG_FILE
fi

# Function to validate installation
# Takes exit status and package name as arguments   
VALIDATE() {
    if [ $1 -eq 0 ];
    then
        echo -e "$G installation of $2 successful $N" $>> $LOG_FILE 
    else
        echo -e "$R $2 installation failed $N" $>> $LOG_FILE
        exit 1 # Exit with an error code if installation fails
    fi
}

# Check and install packages
dnf list installed httpd
if [ $? -ne 0 ]
then
    echo "httpd is not installed, proceeding with installation" $>> $LOG_FILE
    dnf install httpd -y
    VALIDATE $? "httpd"
else 
    echo -e "$G httpd $N" "$Y already installed $N" $>> $LOG_FILE
fi  

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "MySQL is not installed, proceeding with installation" $>> $LOG_FILE
    dnf install mysql -y
    VALIDATE $? "MySQL"
else 
  echo -e "$G MySQL $N" "$Y already installed $N" $>> $LOG_FILE
    
fi

dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed, proceeding with installation" $>> $LOG_FILE
    dnf install python3 -y
    VALIDATE $? "python3"
else 
    echo -e "$G python3 $N" "$Y already installed $N" $>> $LOG_FILE
     
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed, proceeding with installation" $>> $LOG_FILE
    dnf install nginx -y
    VALIDATE $? "nginx"
else 
    echo -e "$G nginx $N" "$Y already installed $N" $>> $LOG_FILE
fi