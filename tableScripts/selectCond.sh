#! /bin/bash

echo -e  "\t\tEnter The Table Name you wanna delete from : \c"
read tableName
if ! [[ -f $tableName ]];then
    echo -e "\t\tThe Table Not Exist "
    $HOME/DBMS/tableScripts/tableMenu.sh 
fi
echo -e  "\t\tEnter The column Name : \c"
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
    echo -e "\t\tThe Column Not Exist "
    $HOME/DBMS/tableScripts/tableMenu.sh
else
    echo -e  "\t\tEnter The Value : \c"
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
        echo -e "\t\tThe Value Not Exist "
        $HOME/DBMS/tableScripts/tableMenu.sh
    else
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
                sed -n ''$num'p' $tableName 2>> /dev/null
                echo -e "Row '$num' Selected Successfully"
                ((count++))
                num=$(echo "$NR" |cut -d" " '-f'$count''|rev )
            done
        else
            sed -n ''$NR'p' $tableName 2>> /dev/null
            echo -e "Row '$num' Selected Successfully"
        fi
        $HOME/DBMS/tableScripts/tableMenu.sh
    fi
fi