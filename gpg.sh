#!/bin/bash

#***************************************************#
#	AUTHOR: https://github.com/craptalk	    #
#***************************************************#

ROOT=0
if [ "$UID" -ne $ROOT ];
then
	echo -e "You need to run this as root\n"
else
	echo -n "Enter filename:"
	read FILE
	while [ -z $FILE ];
	do
		echo -n "Enter filename(possibly to give absolute path):"
		read FILE
	done
	if [ ! -f $FILE ];
	then
		echo -e "$FILE not found!\n"
		echo -e "Program exiting.....\n"
		exit
	fi
	gpg -c -crypto-algo=AES256 $FILE >& /dev/null
	if [ $? -eq 0 ];
	then
		echo -e "$FILE is successfully encrypted\n"
	fi
fi 
