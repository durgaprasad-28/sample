#!/bin/bash
ID=$(id -u)
if [ $ID -gt 0 ]; then
echo "please acces to the root user to install packages- INSTALLATION FAILED"
exit 1
fi
echo "insatlling nginx "
VALIDATE() {
if [ $1 -ne 0 ]; then
echo "$2"
exit 1
else
echo "$3"
fi
}
dnf install nginx -y
VALIDATE $? "check the command" "SUCCESSFULLY INSTALLED NGINX"
dnf install mysql -y
VALIDATE $? "check the command" "SUCCESSFULLY INSTALLED MYSQL"
dnf install nodejs -y
VALIDATE $? "check the command" "SUCCESSFULLY INSTALLED NODEJS"

