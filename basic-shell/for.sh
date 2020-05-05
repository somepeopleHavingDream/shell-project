#!/bin/bash

sum=0
for (( i=1;i<=100;i++ ))
	do
		sum=$(($i+$sum))
	done

echo $sum
