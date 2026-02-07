#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"
limit=3
ip_address= curl "http://169.254.169.254/latest/meta-data/local-ipv4" 
disk_info=$(df -hT | grep -v Filesystem)
echo -e  "$R alert:high disk usage$N"
while IFS= read -r line ;
do
 usage=$(echo "$line" | awk '{print $6}' | cut -d "%" -f1)
 partition_name=$(echo "$line" | awk '{print $7}')
if [ $usage -gt $limit ] ; then
message+="$partition_name-$usage% <br>"
fi
done <<< $disk_info
echo -e "$message"
sh mail.sh "dpworld726@gmail.com" "usage alert" "dpteam" "disk usage" "$ip_address" "$message"