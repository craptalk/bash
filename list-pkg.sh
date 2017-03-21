#!/bin/bash

#################################################
#	AUTHOR: https://github.com/craptalk	#
#################################################

function display()
{

      echo -e "|**********************************|"
      echo -e "|    Display installed packages    |"
      echo -e "|**********************************|\n\n"
}

display

echo -n "Package name:"
read PKG

dpkg -l | grep $PKG
if [[ $? -ne 0 ]];
then
	echo -e "$PKG is not installed yet."
fi
exit 0
