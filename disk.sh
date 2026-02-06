#!/bin/bash
limit=3
disk_info=$(df -hT | grep -v Filesystem)
while IFS= read -r line ;
do
 usage=$(echo "$line" | awk '{print $6}' | cut -d "%" -f1)
 partition_name=$(echo "$line" | awk '{print $7}')
if [ $usage -gt $limit ] ; then
echo "disk  is high,they are:-echo $usage% - $partition_name"
fi
done <<< $disk_info