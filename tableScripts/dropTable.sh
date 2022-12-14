	echo -e "\t\tEnter The name of Table You Wanna Drop : \c"
    read tableName

    rm $tableName config_$tableName 2>> /dev/null

    if [[ $? == 0 ]]
    then
        echo -e "\n\t\tThe Table Was Dropped Successfully \U0001f63a "
        $HOME/DBMS/tableScripts/tableMenu.sh 
    else
        echo -e "\n\t\tThe Table Wasn't Found \U0001f63f"
    fi
    $HOME/DBMS/tableScripts/tableMenu.sh