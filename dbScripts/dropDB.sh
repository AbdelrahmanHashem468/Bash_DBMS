#!/bin/bash

echo -e "\n\t\t\tIf you want to Drop all table write *all \n"
echo -e "\t\t\tEnter Datebase Name to Drop: \c \n"
read delName
if [[ -d $HOME/DBMS/DBS/"$delName"  ]]; then
	rm -r $HOME/DBMS/DBS/"$delName"
	echo -e "\n\n\n\n\n\n\n\n\n\n\n\n"
	echo -e "\t\t==================================================="
	echo -e "\n\t\t\tThe $delName Database Deletted Succesful \U0001F601 \n"
	echo -e "\t\t==================================================="

else
	if [[ $delName == *all ]]; then
		rm -r $HOME/DBMS/DBS/*
		echo -e "\n\n\n\n\n\n\n\n\n\n\n\n"
		echo -e "\t\t==================================================="
		echo -e "\n\t\t\t\t All Databases Deleted \U0001f61f \n"
		echo -e "\t\t==================================================="
	else
		echo -e "\n\n\n\n\n\n\n\n\n\n\n\n"
		echo -e "\t\t==================================================="
		echo -e "\n\t\t\tThe $delName DataBase Is't Exist \U0001f60a \n"
		echo -e "\t\t==================================================="
	fi
fi

$HOME/DBMS/main.sh
