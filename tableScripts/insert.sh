#! /bin/bash

echo -e "\n\t\t\tEnter Table Name: \c"
read tableName
if ! [[ -f $tableName ]]; then
    echo -e "\n\t\t\t====================================\n"
    echo -e "\t\t\tTable $tableName isn't Exist, Try again \U0001f625"
    echo -e "\n\t\t\t====================================\n"
    $HOME/DBMS/tableScripts/tableMenu.sh 
fi

count=1
sep=":"
rsep="\n"
pKey=""

colsNum=`awk 'END{print NR}' .$tableName`
for ((i = 2; i <=$colsNum; i++)); do

colName=$( awk 'BEGIN{FS="|"}{ if(NR=='$i') print $1}' .$tableName)
done   