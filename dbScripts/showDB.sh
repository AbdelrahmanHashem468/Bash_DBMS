#! /bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'
cd $HOME/DBMS/DBS
if [[ `ls -1 | wc -l` -eq '0' ]]; then
		echo -e "\n\n\n\n\n\n\n\n\n\n\n\n"
		echo -e "\t\t============================================="
		echo -e "\n\t\t\tThere no DataBases ${RED}Exist${NC}  \U0001f60a \n"
		echo -e "\t\t============================================="
else
		echo -e "\n\n\n\n\n\n\n\n\n\n\n\n"
		echo -e "\t\t==================================================="
        echo -e "\n\t\t" `ls -1 -d  */ 2>>/dev/null` "\U0001F601 \n"
		echo -e "\t\t==================================================="
fi
$HOME/DBMS/main.sh
