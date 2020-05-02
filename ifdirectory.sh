#!/bin/bash

read -t 30 -p "Please input a directory: " dir
if [ -d "$dir" ]
	then
		echo "$dir是一个目录"
	else
		echo "$dir不是一个目录"
fi
