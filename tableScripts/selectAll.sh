#! /bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'


echo -e "\t\t\t=> Enter Table Name: \c"
read tableName


if ! [[ -f $tableName ]]; then
    echo -e "\n\t\t\t\tThe Table ${RED}Does't Exist${NC} Choose another Name \n"
    $HOME/DBMS/tableScripts/selectAll.sh
    else
    awk 'BEGIN{FS=":"; ORS = "\n---------------------------\n"}{print "\t\t\n" NR " | ", $tableName}' $tableName
    
fi        

$HOME/DBMS/tableScripts/selectMenu.sh