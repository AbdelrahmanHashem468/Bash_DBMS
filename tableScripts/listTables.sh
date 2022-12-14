
numColu=`ls  [^config_]* 2>> /dev/null | wc -w`
if [[ $numColu -eq 0 ]]
then
    echo -e "\n\t\tThere is no Tables Exist \U0001f63f \n"
else
    echo -e "\n\t\t\t\t " `ls [^config_]* 2>> /dev/null` "\U0001F601 \n"

fi
$HOME/DBMS/tableScripts/tableMenu.sh 