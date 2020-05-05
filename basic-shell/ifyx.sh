#!/bin/bash

test=$(env | grep USER | cut -d "=" -f 2)
if [ "$test" == "yx" ]; then
	echo "当前登录用户是yx身份"
fi
