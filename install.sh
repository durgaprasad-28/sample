#!/bin/bash
ID=$(id -u)
if [ $ID -gt 0 ]; then
echo "please acces to the root user to install packages- INSTALLATION FAILED"
exit 1
fi
echo "insatlling nginx "
dnf install nginx -y
if [ $? -ne 0 ]; then
echo "check the command once"
exit 1
else
echo "SUCCESSFULLY INSTALLED NGINX"
fi
dnf install mysql -y
if [ $? -ne 0 ]; then
echo "check the command once"
exit 1
else
echo "SUCCESSFULLY INSTALLED MYSQL"
fi
dnf install nodejs -y
if [ $? -ne 0 ]; then
echo "check the command once"
exit 1
else
echo "SUCCESSFULLY INSTALLED NGINX"
fi

