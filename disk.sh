#!/bin/bash
limit=3
usage=$(df -hT | grep -v Filesystem | awk '{print $6}' | cut -d "%" -f1)
partition_name=$(df -hT | grep -v Filesystem | awk '{print $7}')
while IFS=read -r line 
do
if [ echo $line -gt $limit ]; then
echo "disk usage is high,they are:-echo $line% - $partition_name"
fi
done <<< usage