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
	echo -e "\t\tEnter Your Choice : \c"
	read char
	
	case $char in 
		1) echo -e "\t\tYou select Create Table\n";;
		2) echo -e "\t\tYou select List Tables\n";;
		3) echo -e "\t\tYou select Drop Table\n";;
		4) echo -e "\t\tYou select Insert Table\n";;
		5) echo -e "\t\tYou select select From Table\n";;
		6) echo -e "\t\tYou select Delete From Table\n";;
		7) echo -e "\t\tYou select Update From Table\n" ;;
		8) exit ;;
		*) echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\t\t\t\tWrorng Choice \U0001f635 \n";mainMenu;
		echo -e "\t\t\t==============================="
		esac


