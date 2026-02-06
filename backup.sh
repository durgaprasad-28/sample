#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/home/ec2-user/app-logs"
LOGS_FILE="$LOGS_FOLDER/$0.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
sourcedir=$1
destdir=$2
date=${3:-14}
if [ $USERID -ne 0 ]; then
    echo -e "$R Please run this script with root user access $N" | tee -a $LOGS_FILE
    exit 1
fi

mkdir -p $LOGS_FOLDER
log () {
    echo " $(date "%y-%m-%d" "%H-%M-%S) | $1 | tee -a $LOGS_FILE
}
if [ $# -lt 2 ] ; then
log $R you have to give two files for backup $N
if [ -d $sourcedir ] ; then
log no folder was there
fi
if [ -d $destdir ] ; then
log $R no folder was there $N
fi
file=$(find $LOGS_FOLDER $-type f -name "*.log" -mtime +14)
log $G files to archive are $N :$file
archive=destdir/app-logs.tar.gz
tar -czvf $archive $file
if [ ! -f $archive ] ; then
log $R no archive file is created $N
else
while IFS= read -r content ; do
echo "reading $content"
rm -f $content
echo "files are deleted ,they are : $files"
done <<< $file
fi





