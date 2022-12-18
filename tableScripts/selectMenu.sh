#! /bin/bash 
 	echo -e "\n\t\t\t\t==================="
	echo -e "\t\t\t\t|   Select Menu   |"
	echo -e "\t\t\t\t===================\n\n"

  echo -e "\t\t1) Select All Columns of a Table"
  echo -e "\t\t2) Select Specific Column from a Table"
  echo -e "\t\t3) Select From Table under condition"
  echo -e "\t\t4) Aggregate Function for a Specific Column"
  echo -e "\t\t5) Back To Tables Menu"
  echo -e "\t\t6) Back To Main Menu"
  echo -e "\t\t7) Exit"
  echo -e "\t\t Enter Choice: \c"
  read ch
  case $ch in
    1) echo -e "\t\t1) Selected all";;
    2) echo -e "\t\t1) Selected col";;
    3) echo -e "\t\t1) Selected condition";;
    4) echo -e "\t\t1) aggragte function";;
    5) $HOME/DBMS/tableScripts/tableMenu.sh5;;
    6) $HOME/DBMS/main.sh;;
    7) exit ;;
    *) echo " Wrong Choice ";;
  esac
