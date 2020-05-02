#!/bin/bash

read -t 30 -p "Please input a filename: " file
if [ -z "$file" ]; then
	echo "输入错误"
	exit 11
elif [ ! -e "$file" ]; then
	echo "请输入文件名"
	exit 12
elif [ -f "$file" ]; then
	echo "$file是一个普通文件"
elif [ -d "$file" ]; then
	echo "$file是一个目录"
else
	echo "$file是其他文件"
fi
