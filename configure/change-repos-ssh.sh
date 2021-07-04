#!/bin/bash

echo "--> Changing repository type"

# read -p "Enter the username: " USERNAME
# read -p "Enter the repository: " REPOS

while [ -n "$1" ]; do # while loop starts

	case "$1" in

	-u) USERNAME=$2 
		shift	
		;; 

	-r) REPOS=$2
		shift	
		;; 

	-R) REMOTE="$2"
		shift	
	       	;; 
	
	-t)TYPE="$2"
       		shift		
		;; 

	*) echo "Option $1 not recognized" ;; # In case you typed a different option other than a,b,c

	esac

	shift

done

if [[ -z ${USERNAME} || -z ${REPOS} ]]; then
	echo "Username or Repository can't be empty, use -u to specify the username or -r to specify the repository!"
	exit
fi
if [[ -z ${REMOTE} ]]; then
	REMOTE="origin" 
fi

if [[ -n  ${TYPE} ]]; then
 	git remote set-url origin https://github.com/$USERNAME/$REPOS.git

else
	git remote set-url origin git@github.com:$USERNAME/$REPOS.git
	
fi


# echo "${USERNAME}, ${REPOS}, ${REMOTE}"
