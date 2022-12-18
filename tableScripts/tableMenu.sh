#! /bin/bash
	echo -e "\n\t\t\t\t==================="
	echo -e "\t\t\t\t|    Tables Menu    |"
	echo -e "\t\t\t\t===================\n\n"
	echo -e "\t\t1)Create Table\n"
	echo -e "\t\t2)List Tables\n"
	echo -e "\t\t3)Drop Table\n"
	echo -e "\t\t4)Insert Table\n"
	echo -e "\t\t5)select From Table\n" 
	echo -e "\t\t6)Delete From Table\n" 
	echo -e "\t\t7)Update From Table\n" 
	echo -e "\t\t8)Exist\n" 
	echo -e "\t\tEnter Your Choice : \c"
	read char
	
	case $char in 
		1) $HOME/DBMS/tableScripts/createTable.sh;;
		2) $HOME/DBMS/tableScripts/listTables.sh;;
		3) $HOME/DBMS/tableScripts/dropTable.sh;;
		4) $HOME/DBMS/tableScripts/insert.sh;;
		5) $HOME/DBMS/tableScripts/selectMenu.sh;;
		6) $HOME/DBMS/tableScripts/deleteFromTable.sh;;
		7) echo -e "\t\tYou select Update From Table\n" ;;
		8) exit ;;
		*) echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\t\t\t\tWrorng Choice \U0001f635 \n";$HOME/DBMS/tableScripts/tableMenu.sh;;
		esac


