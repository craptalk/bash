#!/bin/bash

#<author:craptalk>
#study purpose-only
#see more netcat implementation via netcat manual page

port=9999
site="termbin.com"
echo "1) CREATE LINK TO TERMBIN"
echo "2) EXIT"
echo -n "ENTER:"
read enter
case $enter in
	1)echo -n "ENTER PATH-TO-FILE[/../]:"
	  read path
	  cat $path 2>/dev/null | nc $site $port 2>/dev/null
	  if [ ! -f $path ]; then
	  echo "FILE $path NOT EXIST!"
	  fi;;
	2)exit
esac
exit 0 #return true
