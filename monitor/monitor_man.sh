#!/bin/bash

resettem=$(tput sgr0)
declare -A ssharray
i=0
numbers=""

for script_file in `ls -I "monitor_man.sh" ./`
do
	echo -e '\e[1;35m' "The script:" ${i} '==>' ${resettem} ${script_file}
	i=$((++i))
done
