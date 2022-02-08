#!/bin/bash

# 3.d.1 - Error checking: no arguments provided
if [ "$#" -lt 1 ]; then echo "Please write one or more subreddit(s) as an argument"; exit; fi

# 3.c - Loop array of arguments
for A in "$@"
do
	# 3.a - extract all image URLs
	IMAGES=$(curl -sH 'user-agent: random_string' https://www.reddit.com/r/$A.json | json_reformat | grep -oE 'https://i.redd.it/.*(jpg|png|gif)' | sort -u)	

	# 3.b.1 - Save current path, create & go to subdiredtory thumbs_$A/
	PWD=$(pwd)
	mkdir ${PWD}/thumbs_$A/
	cd ${PWD}/thumbs_$A/

	# 3.b.2 - Loop the images and save them to the proper directory
	for I in $IMAGES
	do
		wget -q ${I}
	done

	# Return to parent folder
	cd ..	
done
