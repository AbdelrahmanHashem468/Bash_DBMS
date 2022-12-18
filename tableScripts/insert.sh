#! /bin/bash 
RED='\033[0;31m'
NC='\033[0m'
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
colsNum=`awk 'END{print NR}' config_$tableName`
echo -e "\n\t\t\tEnter column name : \c"

record=""
for (( i = 2; i <= $colsNum; i++ )); do

    colName=$(awk 'BEGIN{FS=":"}{ if(NR=='$i') print $1}' config_$tableName)
    colType=$(awk 'BEGIN{FS=":"}{if(NR=='$i') print $2}' config_$tableName)
    colKey=$(awk 'BEGIN{FS=":"}{if(NR=='$i') print $3}' config_$tableName)

    echo -e "\n\t\t\tName of Col ($colName) Type ($colType) = \c"
    read data

    if [[ $colType == "int" ]]; then
        while ! [[ $data =~ ^[0-9]*$ ]]; do

            echo -e "\n\t\t\t${RED}invalid Data Type! Try Again${NC}\n"
            echo -e "\n\t\t\t$colName ($colType) = \c"
            read data

        done
    fi

   


    while [[ true ]]; do
    
 
            
    
    if [[ $colKey == "pk" && -z "$data" ]]; then
        echo -e "\n\t\t\t${RED}You have to write PK${NC}\n"
        echo -e "\n\t\t\t$colName ($colType) = \c"
        read data
        else
        break
        
    fi



    done

    #Set record
    if [[ $i == $colsNum ]]; then
      record=$record$data$rSep3
    else
      record=$record$data$sep
    fi


done
echo -e $record >> $tableName


 $HOME/DBMS/tableScripts/tableMenu.sh
