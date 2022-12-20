#!/bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "\n\t\t\t=> Enter Datebase Name to Connect: \c \n"
read dName


cd $HOME/DBMS/DBS/"$dName" 2>> /dev/null

if [[ $? == 0 ]]; then
	echo -e "\t\t==================================================="
	echo -e "\n\t\tThe $dName DataBase was ${GREEN}Successfully ${NC}Selected \U0001F601 \n"
	echo -e "\t\t==================================================="	
	$HOME/DBMS/tableScripts/tableMenu.sh 
else
	echo -e "\n\n\n\n\n\n\n\n\n\n\n\n"
	echo -e "\t\t==================================================="
	echo -e "\n\t\t\tThe $dName DataBase ${RED}Is't Exist${NC} \U0001f60a \n"
	echo -e "\t\t==================================================="
	$HOME/DBMS/main.sh
fi


