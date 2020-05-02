#!/bin/bash

read -t 30 -p "Please input yes/no: " choice
case "$choice" in
	"yes")
		echo "right"
		;;
	"no")
		echo "error"
		;;
	*)
		echo "other"
		;;
esac
