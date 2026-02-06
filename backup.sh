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
   echo " $(date "+%y-%m-%d %H-%M-%S") | $1" | tee -a $LOGS_FILE
}
if [ $# -lt 2 ] ; then
log  "you have to give two files for backup" 
exit 1
fi
if [ ! -d $sourcedir ] ; then
log "no folder was there"
exit 1
fi
if [ ! -d $destdir ] ; then
log  "no folder was there" 
exit 1
fi
file=$(find $sourcedir -type f -name "*.log" -mtime +14)
if [ -z "$file" ] ; then
log "your folder is empty"
exit 1
else
log "files to archive are  :$file"
fi
archive="$destdir/app-logs.tar.gz"
tar -zcvf $archive $file
if [ ! -f $archive ] ; then
log  "no archive file is created" 
exit 1
else
while IFS= read -r content ; do
echo "reading $content"
rm -f $content
echo "files are deleted ,they are : $content"
done <<< $file
fi