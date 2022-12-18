#! /bin/bash 	
  echo -e "\n\t\t\t\t==========================" 
  echo -e "\t\t\t\t|   Select Condtion Menu  |"
  echo -e "\t\t\t\t==========================\n\n"
  echo -e "\t\t1) Select All Columns Matching Condition "
  echo -e "\t\t2) Select Specific Column Matching Condition"
  echo -e "\t\t3) Back To Selection Menu "
  echo -e "\t\t4) Back To Main Menu "
  echo -e "\t\t5) Exit"
  echo -e "\t\tEnter Choice: \c"
  read ch
  case $ch in
    1) echo -e "\t\t1) Selected condition";;
    2) echo -e "\t\t1) Selected condition";;
    3) $HOME/DBMS/tableScripts/selectMenu.sh;;
    4) $HOME/DBMS/main.sh;;
    5) exit ;;
    *) echo " Wrong Choice " ;$HOME/DBMS/tableScripts/selectMenu.sh;
  esac