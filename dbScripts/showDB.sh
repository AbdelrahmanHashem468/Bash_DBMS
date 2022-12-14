#! /bin/bash
cd $HOME/DBMS/DBS
if [[ `ls -1 | wc -l` -eq '0' ]]; then
		echo -e "\n\n\n\n\n\n\n\n\n\n\n\n"
		echo -e "\t\t==================================================="
		echo -e "\n\t\t\tThere no DataBases  Exist \U0001f60a \n"
		echo -e "\t\t==================================================="
else
		echo -e "\n\n\n\n\n\n\n\n\n\n\n\n"
		echo -e "\t\t==================================================="
        echo -e "\n\t\t\t\t " `ls -1 -d  */ 2>>/dev/null` "\U0001F601 \n"
		echo -e "\t\t==================================================="
fi
$HOME/DBMS/main.sh
