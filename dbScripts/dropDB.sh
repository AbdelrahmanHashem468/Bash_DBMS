#!/bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "\n\t\t\tIf you want to Drop all table write *all \n"
echo -e "\n\t\t\t=> Enter Datebase Name to Drop: \c \n"
read delName
if [[ -d $HOME/DBMS/DBS/"$delName"  ]]; then
	rm -r $HOME/DBMS/DBS/"$delName"
	echo -e "\n\n\n\n\n\n\n\n\n\n\n\n"
	echo -e "\t\t===================================================="
	echo -e "\n\t\t\tThe $delName Database ${RED}Deleted${NC} Succesful \U0001F601 \n"
	echo -e "\t\t===================================================="

else
	if [[ $delName == *all ]]; then
		rm -r $HOME/DBMS/DBS/*
		echo -e "\n\n\n\n\n\n\n\n\n\n\n\n"
		echo -e "\t\t===================================================="
		echo -e "\n\t\t\t\tAll Databases ${RED}Deleted${NC} \U0001f61f \n"
		echo -e "\t\t===================================================="
	else
		echo -e "\n\n\n\n\n\n\n\n\n\n\n\n"
		echo -e "\t\t===================================================="
		echo -e "\n\t\t\tThe $delName DataBase Is't ${RED}Exist${NC} \U0001f60a \n"
		echo -e "\t\t===================================================="
	fi
fi

$HOME/DBMS/main.sh
