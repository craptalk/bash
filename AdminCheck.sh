#!/bin/bash
echo -n "Press [Y] to check your account role: "
read ans
if [ -z $ans ];then
	exit -1
elif [ $ans = 'Y' ];then
	acc=$USER
	path=/etc/group
	blackhole=/dev/null
	check=$(cat $path | grep "$acc" 2>$blackhole)
	echo $check
else
	exit -1
fi
exit 0
