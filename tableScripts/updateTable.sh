#!/bin/bash -x
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e  "\n\t\t\t=> Enter The Table Name you wanna Update : \c"
read tableName
if ! [[ -f $tableName ]];then
    echo -e "\t\tThe Table Not Exist "
    $HOME/DBMS/tableScripts/tableMenu.sh 
    read tableName
fi
echo -e  "\n\t\t\t=> Enter The column Name : \c"
read coluName
numField=$(
awk '
BEGIN{FS=":"}
    {
        if(NR==1)
            {
                for(i=1;i<=NF;i++)
                {
                    if("'$coluName'"==$i) print i
                }
            }
    }' $tableName 2>> /dev/null)
if [[ $numField == "" ]]
then
    echo -e "\n\t\t\tThe Column Not Exist \n"
    $HOME/DBMS/tableScripts/tableMenu.sh
else
    echo -e  "\n\t\t\t=> Enter The Value : \c"
    read -r  value
    res=$(
        awk '
            BEGIN{FS=":"}
            {
                if ( $'$numField' == "'$value'") print $'$numField'
            }
        ' $tableName 2>> /dev/null)
        echo $flag
    if [[ $res == "" ]]
        then
        echo -e "\n\t\t\tThe Value Not Exist\n"
        $HOME/DBMS/tableScripts/tableMenu.sh
    else



        echo -e  "\n\t\t\t=> Enter The Set Column Name : \c"
        read setColu
        setColNum=$(
        awk '
        BEGIN{FS=":"}
            {
                if(NR==1)
                    {
                        for(i=1;i<=NF;i++)
                        {
                            if("'$setColu'"==$i) print i
                        }
                    }
            }' $tableName 2>> /dev/null)
        if [[ $setColNum == "" ]]
        then
            echo -e "\n\t\t\tThe Column Not Exist\n"
            $HOME/DBMS/tableScripts/tableMenu.sh
        else
            echo -e  "\n\t\t\t=> Enter The Value : \c"
            read -r  setValue
            colsNum=`awk 'END{print NR}' config_$tableName`
            for (( i = 2; i <= $colsNum; i++ )); do
                colLineNumber=`cut -d: -f3 config_$tableName | grep -n -w "^pk$" | cut -d: -f1`
                colLineNumber=$(($colLineNumber-1))
                colKey=$(awk 'BEGIN{FS=":"}{if(NR=='$i') print $3}' config_$tableName)
                if [[ $colKey == "pk" ]]; then
                    while [ true ]; do
                    checkpk=`cut -d: -f"$colLineNumber" $tableName | grep -c -w "$setValue"`  

                    if [[ $checkpk != 0 ]]; then
                        echo -e "\n\n\t\t\t\t\t${RED}Duplcated PK${NC}\n"
                        echo -e  "\n\t\t\t=> Enter The Value : \c"
                        read setValue
                        else
                        break;
                    fi

                    done
                fi
            done
            NR=$(
                awk '
                    BEGIN{FS=":"}
                    {
                        if ($'$numField'=="'$value'") print NR
                    }
                ' $tableName 2>> /dev/null)
            NR=${NR//$'\n'/" "}
            field=$(echo $NR | awk -F" " '{print NF}')
            if [[ $field != 1 ]];then
                NR=$(echo "$NR" | rev |cat)
                count=1
                num=$(echo "$NR" | cut -d" " -f1 | rev ) 
                while [[ $num != "" ]]
                do
                oldValue=$(
                awk '
                BEGIN{FS=":"}
                    {
                        if(NR=='$num')
                            {
                                for(i=1;i<=NF;i++)
                                {
                                    if('$setColNum'==i) print $i
                                }
                            }
                    }' $tableName 2>> /dev/null)
                    sed -i ''$num's/'$oldValue'/'$setValue'/g' $tableName 2>> /dev/null
                    echo -e "\n\t\t\tRow $num Updated ${GREEN} Successfully${NC}"
                    ((count++))
                    num=$(echo "$NR" |cut -d" " '-f'$count''|rev )
                done
            else
                        oldValue=$(
                awk '
                BEGIN{FS=":"}
                    {
                        if(NR=='$NR')
                            {
                                for(i=1;i<=NF;i++)
                                {
                                    if('$setColNum'==i) print $i
                                }
                            }
                    }' $tableName 2>> /dev/null)
                sed -i ''$NR's/'$oldValue'/'$setValue'/g' $tableName 2>> /dev/null
                echo -e "\n\t\t\tRow '$NR' Deleted Successfully\n"
            fi
            $HOME/DBMS/tableScripts/tableMenu.sh
        fi  
    fi
fi