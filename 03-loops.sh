#!/bin/bash
ID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"
if [ $ID -gt 0 ]; then
echo "please acces to the root user to install packages- INSTALLATION FAILED" | tee -a $LOGS_FILE
exit 1
fi
mkdir -p $LOGS_FOLDER
VALIDATE() {
if [ $1 -ne 0 ]; then
echo "$2" | tee -a $LOGS_FILE
exit 1
else
echo "$3" | tee -a $LOGS_FILE
fi
}
for package in $@
do
   dnf list installed $package
   if [ $? -ne 0 ]; then
   installing $package
  dnf install $package -y &>> $LOGS_FILE
  VALIDATE $? "check the command" "SUCCESSFULLY INSTALLED $package"
  else
   echo "already installed $package,ignore it" | tee -a $LOGS_FILE
   fi 
done 


