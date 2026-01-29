#!/bin/bash
ID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"
if [ $ID -gt 0 ]; then
echo "please acces to the root user to install packages- INSTALLATION FAILED" | tee $LOGS_FILE
exit 1
fi
mkdir -p $LOGS_FOLDER
echo "insatlling nginx "
VALIDATE() {
if [ $1 -ne 0 ]; then
echo "$2"
exit 1
else
echo "$3"
fi
}
dnf install nginx -y &>> $LOGS_FILE
VALIDATE $? "check the command" "SUCCESSFULLY INSTALLED NGINX" | tee -a $LOGS_FILE
dnf install mysql -y &>> $LOGS_FILE
VALIDATE $? "check the command" "SUCCESSFULLY INSTALLED MYSQL" | tee -a $LOGS_FILE
dnf install nodejs -y &>> $LOGS_FILE
VALIDATE $? "check the command" "SUCCESSFULLY INSTALLED NODEJS" | tee -a $LOGS_FILE

