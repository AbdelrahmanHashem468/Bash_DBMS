#!/bin/bash

echo -e "\t\tEnter Datebase Name to Connect: \c \n"
read dName


cd $HOME/DBMS/DBS/"$dName" 2>> /dev/null

if [[ $? == 0 ]]; then
	echo -e "\t\t==================================================="
	echo -e "\n\t\t\tThe $dName DataBase was Successfully Selected \U0001F601 \n"
	echo -e "\t\t==================================================="	
	$HOME/DBMS/tableScripts/tableMenu.sh 
else
	echo -e "\n\n\n\n\n\n\n\n\n\n\n\n"
	echo -e "\t\t==================================================="
	echo -e "\n\t\t\tThe $dName DataBase Is't Exist \U0001f60a \n"
	echo -e "\t\t==================================================="
	$HOME/DBMS/main.sh
fi


