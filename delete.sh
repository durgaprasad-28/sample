#!/bin/bash
logs_folder="/home/ec2-user/app-logs"
LOGS_FILE="$LOGS_FOLDER/$0.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
if [ ! -d $logs_folder }; then
echo "your searching file doesnt exist"
exit 1
else
echo -e  "$G the folder exists, waiting for ur command boss"
fi
your_folder=$(find $logs_folder -type f -name "*.log" -mtime +14)
echo "your required files are $B $your_folder"
while IFS=read -r files ; do
echo "reading $files"
done <<< $your_folder