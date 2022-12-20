#! /bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

<<<<<<< HEAD
echo -e  "\t\tEnter The Table Name you wanna Select from : \c"
=======
echo -e  "\n\t\t\t=> Enter The Table Name You want to Select from : \c"
>>>>>>> 1bea4de845a0adeca23b947a28a183a0d0df4360
read tableName
if ! [[ -f $tableName ]];then
    echo -e "\n\t\t\tThe Table ${RED}Doens't Exist${NC} \n"
    $HOME/DBMS/tableScripts/tableMenu.sh 
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
    echo -e "\t\t\tThe Column ${RED}Don't Exist${NC} "
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
        echo -e "\n\t\t\tThe Value ${RED}Don't Exist${NC} \n"
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
                echo -e "Row '$num' ${GREEN}Selected Successfully${NC}"
                ((count++))
                num=$(echo "$NR" |cut -d" " '-f'$count''|rev )
            done
        else
            sed -n ''$NR'p' $tableName 2>> /dev/null
            echo -e "\n\t\t\tRow $NR ${GREEN}Selected Successfully${NC}\n"
        fi
        $HOME/DBMS/tableScripts/tableMenu.sh
    fi
fi