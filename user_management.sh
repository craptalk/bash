#!/bin/bash

#AUTHOR: https://www.github/com/craptalk

function log_group()
{
	exec=$(cat /etc/group | grep $LOGNAME)
	echo $exec
}

function log_name()
{
	echo $LOGNAME
}

function notif_root()
{
	echo -e "|============================|"
	echo -e "|THIS REQUIRE ROOT PRIVILEGES|"
	echo -e "|============================|"
}

function add_user()
{	
	state=false
	path="/etc/passwd"
	notif_root	
	echo -n "Enter your desired new username:"
	read username
	
	while [ $( getent passwd $username 2>/dev/null) ] #check already existing username
	do
		echo -e "Username already exist, plese try another username"
		echo -n "Enter your desired new username:"
		read username
	done
	
	exec=$(sudo useradd $username 1>/dev/null)
	echo $exec
	echo "username: $username has been successfully created!"
}

function c_user_password()
{
	notif_root
	echo -n "Enter username:"
	read username
	if [ $(getent passwd $username 2>/dev/null) ];
	then
		exec=$(sudo passwd $username)
		echo $exec
		echo "Password has been successfully changed for user: $username"
	else
		echo "$username is not on the list!"
	fi
}

function c_user_group() 
{
	notif_root
	echo -n "Check existing username[Yy|Nn]:"
	read ans
	if [[ "$ans" == [Yy] ]];
	then
		check=$(awk -F ':' '{ print $1 }' /etc/passwd)
		echo $check
	fi

	echo -n "Check existing groupname[Yy|Nn]:"
	read group
	if [[ "$group" == [Yy] ]];
	then
		check=$(awk -F ':' '{ print $1 }' /etc/group)
		echo $check		
	fi
	
	echo -n "Enter username:"
	read username
	echo -n "Enter groupname:"
	read groupname
	
	if [[ $(getent group $groupname) && $(getent passwd $username) ]];
	then
		exec=$(sudo usermode -aG $groupname $username 2>/dev/null)
		echo $exec
		echo "$username has been changed into group $groupname"
	else
		echo "$username and $groupname are not on the list!"
	fi
}

function print_func() 
{
	echo -e "1)Print your current LOGNAME"
	echo -e "2)Print your current LOGNAME group"
	echo -e "3)Add new user"
	echo -e "4)Set/Change User Passwords"
	echo -e "5)Add user into particular group"
}

print_func
echo -n "Enter:"
read choice

case $choice in
	1)log_name;;
	2)log_group;;
	3)add_user;;
	4)c_user_password;;
	5)c_user_group;;	
esac
