#!/bin/bash

test=$(df -h | grep sda7 | awk '{print $5}' | cut -d "%" -f 1)
if [ "$test" -ge "40" ]; then
	echo "根分区使用率超过40%"
fi
