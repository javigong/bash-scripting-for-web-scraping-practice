#!/bin/bash

#Lab2 - Answers

# 1.a

FOLDERS=$(curl -s https://learn.operatoroverload.com/~jmadar/dogs/ | grep -o -E '(dog-[[:digit:]]{1,}/|[[:digit:]]{1,}-dog/)' | sort -u -V)

# 1.b

# Loop over FOLDERS array
for F in $FOLDERS
do
	# code snippet check if webpage exists
	CODE=$(curl -o /dev/null --silent -Iw '%{http_code}' https://learn.operatoroverload.com/~jmadar/dogs/${F}dog.jpg)
	
	if [[ $CODE == '200' ]]
	then
    		echo "https://learn.operatoroverload.com.com/~jmadar/dogs/${F}dog.jpg"
	fi
done
