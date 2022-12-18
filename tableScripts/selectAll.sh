#! /bin/bash

echo -e "\t\t\tEnter Table Name: \c"
read tableName


if ! [[ -f $tableName ]]; then
    echo -e "\n\t\t\t\t The Table don't Exist Choose another Name "
    $HOME/DBMS/tableScripts/selectAll.sh
    else
    `cat $tableName`
    read x
fi        