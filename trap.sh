#!/bin/bash
set -e
trap 'echo "there is an error in $LINENO,command : $BASH_COMMAND" ' ERR
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"
ID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"
if [ $ID -gt 0 ]; then
echo -e " $Y please acces to the root user to install packages $N - $R INSTALLATION FAILED" | tee -a $LOGS_FILE
exit 1
fi
mkdir -p $LOGS_FOLDER
for package in $@
do
   dnf list installed $package &>> $LOGS_FILE
   if [ $? -ne 0 ]; then
    echo "installing $package"
  dnf install $package -y &>> $LOGS_FILE
  else
   echo -e " $B already installed $package,ignore it" | tee -a $LOGS_FILE
   fi 
done 


