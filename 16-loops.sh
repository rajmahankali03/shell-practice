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
PACKAGES=("mysql", "httpd", "python3", "nginx")

mkdir -p $LOGS_FOLDER
echo "Script started at $(date)" $>> $LOG_FILE

if [ $userid -ne 0 ];  # Check if the user ID is not equal to 0 (root user)
then
    echo -e "$R Error: You are not root user, please run as root $N" | tee -a $LOG_FILE
    exit 1 # Exit the script with an error code if not root
    else
    echo -e "$G You are root user, proceeding with installation $N"  | tee -a $LOG_FILE
fi

# Function to validate installation
# Takes exit status and package name as arguments   
VALIDATE() {
    if [ $1 -eq 0 ];
    then
        echo -e "$G installation of $2 successful $N"  | tee -a $LOG_FILE
    else
        echo -e "$R $2 installation failed $N"  | tee -a $LOG_FILE
        exit 1 # Exit with an error code if installation fails
    fi
}

for package in ${PACKAGES[@]}
do
    dnf list installed $package $>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, proceeding with installation"  | tee -a $LOG_FILE
        dnf install $package -y $>>$LOG_FILE
        VALIDATE $? "$package"
    else 
        echo -e "$G $package $N" "$Y already installed $N"  | tee -a $LOG_FILE
    fi  
done