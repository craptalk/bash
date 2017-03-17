#!/bin/bash

Blue='\e[0;34m'
BPurple='\e[1;35m'
BCyan='\e[1;36m'
BRed='\e[1;31m'
BGreen='\e[1;32m'

function notif()
{
	echo -en "${BPurple}********************************\n"
	echo -en "${BPurple}*****Enable Wifi Connection*****\n"
	echo -en "${BPurple}*********************************\n"
}

function scan()
{
	nmcli d wifi list
}

function menu()
{
	echo -e "${BPurple}1)Scan available networks"
	echo -e "${BPurple}2)Connect into WiFi network"
	echo -e "${BRed}3)Exit"
}

notif
menu
echo -en "${BGreen}Enter:"
read answer

case $answer in
	1)echo -en "${Blue}Scanning.......\n
		  |Found|\n\n"
		  scan;;
	2)echo -n "Enter SSID:"
		  read ssid
          echo -n "Enter passphrase:"
		  read pass
	  echo -en "${BGreen}Connecting to $ssid.....\n"
	  nmcli device wifi connect $ssid password $pass 2>/dev/null
	  if [ $? = 0 ]; 
	  then
    		echo -en "${Blue}Connected!!\n\n\n"
	  else
		echo -en "${BRed}Failed to connect!!!"
  	  fi;;
	3)if [ $? = 0 ];
	  then echo "Exiting...."
	  fi;;
esac
