#!/bin/bash
echo "Select the menu[1..4]:"
echo "1) list all $USER running programs"
echo "2) list selected $USER running programs"
echo "3) display the default UNIX command to display running programs"
echo "4) exit"
read OPTION
case $OPTION in
	1) ps -ef | grep -w $USER;;
	2) echo "input <program_name>"
	   read NAME
    	   ps -ef | grep $NAME
	   exit 0;;
	3) echo "ps -ef";;
	4) exit;;
esac
exit 0
