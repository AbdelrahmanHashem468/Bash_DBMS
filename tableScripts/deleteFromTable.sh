#! /bin/bash -x

echo -e  "\t\tEnter The Table Name : \c"
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
        sed -i ''$NR'd' $tableName 2>> /dev/null
        echo -e "\t\tRow Deleted Successfully"
        $HOME/DBMS/tableScripts/tableMenu.sh
    fi
fi