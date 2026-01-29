#!/bin/bash
ID=$(id -u)
if [ $ID -gt 0 ]; then
echo "please acces to the root user to install nginx- INSTALLATION FAILED"
exit 1
fi
echo "insatlling nginx "
dnf install nginx -y
echo "SUCCESSFULLY INSTALLED NGINX"
