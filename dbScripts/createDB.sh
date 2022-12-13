#!/bin/bash

#Ctreate Database Function
echo -e "\n\t\t\tPlease Enter Datebase Name: \c" 
read dbName


if [[ $dbName == *['!'@#\$%^\&*()_+]* ]]; then
	echo -e "\n\n\n\n\n\n\n\n\n\n\n\n"
	echo -e "\n\t\t==================================================="
	echo -e "\n\t\t\tIt Contains Special Charachters \U0001f620 \n"
	echo -e "\t\t==================================================="
	

elif [[ -d $HOME/DBMS/DBS/"$dbName" ]]; then 
	echo -e "\n\n\n\n\n\n\n\n\n\n\n\n"
	echo -e "\t\t\t================================"
	echo -e "\n\t\t\t\tAlready Exict \U0001f625 \n"
	echo -e "\t\t\t================================"	
else
	
	echo -e "\n\n\n\n\n\n\n\n\n\n\n\n"	
	echo -e "\t\t==================================================="
	echo -e "\n\t\t\tThe $dbName Database Created Succsful \U0001F601 \n"
	echo -e "\t\t==================================================="
	mkdir $HOME/DBMS/DBS/"$dbName"
fi



$HOME/DBMS/main.sh
