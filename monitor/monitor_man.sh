#!/bin/bash

resettem=$(tput sgr0)
declare -A sharray
i=0
numbers=""

for script_file in `ls -I "monitor_man.sh" ./`
do
	echo -e '\e[1;35m' "The script:" ${i} '==>' ${resettem} ${script_file}
	sharray[$i]=${script_file}
	numbers="${numbers} | ${i}"
	i=$((++i))
done

while true
do
	read -p "Please input a number [ ${numbers} ]:" execshell
	if [[ ! ${execshell} =~ ^[0-9]+ ]]; then
		exit 0
	fi

	/bin/bash ./${sharray[$execshell]}
done
