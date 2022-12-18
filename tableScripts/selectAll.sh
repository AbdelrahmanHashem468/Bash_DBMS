#! /bin/bash

echo -e "\t\t\tEnter Table Name: \c"
read tableName


if ! [[ -f $tableName ]]; then
    echo -e "\n\t\t\t\t The Table don't Exist Choose another Name "
    $HOME/DBMS/tableScripts/selectAll.sh
    else
    awk 'BEGIN{FS=":"; ORS = "\n-------------------\n"}{print "\t\t\n", $tableName}' $tableName
    
fi        

$HOME/DBMS/tableScripts/selectMenu.sh