#! /bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

bold=$(tput bold)
normal=$(tput sgr0)

echo -e "\n\t\t\t================================\n"
echo -e "\t\t\t Welcome To ${bold} H & H ${normal}DBSM System\n"
echo -e "\t\t\t================================"


function mainMenu {
	echo -e "\n\t\t\t\t==================="
	echo -e "\t\t\t\t|    Main Menu    |"
	echo -e "\t\t\t\t===================\n\n"
	echo -e "\t\t1) Create Database\n"
	echo -e "\t\t2) List Databases\n"
	echo -e "\t\t3) Connect To Database\n"
	echo -e "\t\t4) Drop Database\n"
	echo -e "\t\t5) Exit\n" 
	echo -e "\t\t\t=> Enter Your Choice: \c"
	read char
	
	case $char in 
		1) $HOME/DBMS/dbScripts/createDB.sh;;
		2) $HOME/DBMS/dbScripts/showDB.sh;;
		3) $HOME/DBMS/dbScripts/connectDB.sh;;
		4) $HOME/DBMS/dbScripts/dropDB.sh;;
		5) exit ;;
		*) 
		echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\t\t\t\t  ${RED}Wrorng Choice ${NC}\U0001f635 \n";mainMenu;
		echo -e "\t\t\t==============================="
		esac

}

mainMenu


