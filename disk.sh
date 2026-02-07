#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"
limit=3
disk_info=$(df -hT | grep -v Filesystem)
while IFS= read -r line ;
do
 usage=$(echo "$line" | awk '{print $6}' | cut -d "%" -f1)
 partition_name=$(echo "$line" | awk '{print $7}')
if [ $usage -gt $limit ] ; then
message+=disk  is high,they are:-$partition_name-$usage% \n
fi
done <<< $disk_info
echo -e "$message"