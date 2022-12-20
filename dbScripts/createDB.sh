#!/bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'
#Ctreate Database Function
echo -e "\n\t\t\t=> Please Enter Datebase Name: \c" 
read dbName
	
source $HOME/DBMS/checkSyntax.sh $dbName

if [[ $? == 0 ]]; then
	
	echo -e "\n\n\n\n\n\n\n\n\n\n\n\n"
	echo -e "\n\t\t==================================================="
	echo -e "\n\t\t\tIt Contains ${RED}Special Charachters${NC} \U0001f620 \n"
	echo -e "\t\t==================================================="
	$HOME/DBMS/dbScripts/createDB.sh
	
elif [[ -d $HOME/DBMS/DBS/"$dbName" ]]; then 
	echo -e "\n\n\n\n\n\n\n\n\n\n\n\n"
	echo -e "\t\t\t================================"
	echo -e "\n\t\t\t\tAlready ${RED}Exist${NC} \U0001f625 \n"
	echo -e "\t\t\t================================"	
	$HOME/DBMS/dbScripts/createDB.sh	
else
	
	echo -e "\n\n\n\n\n\n\n\n\n\n\n\n"	
	echo -e "\t\t==================================================="
	echo -e "\n\t\tThe $dbName Database Created ${GREEN}Succsfuly${NC} \U0001F601 \n"
	echo -e "\t\t==================================================="
	mkdir $HOME/DBMS/DBS/"$dbName"
fi

$HOME/DBMS/main.sh
