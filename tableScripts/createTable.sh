#!/bin/bash
echo -e "\n\t\tEnter The Table Name : \c"
read tableName


source $HOME/DBMS/checkSyntax.sh $tableName
if [[ $? == 0 ]]; then
	
	echo -e "\n\n\n\n\n\n\n\n\n\n\n\n"
	echo -e "\n\t\t==================================================="
	echo -e "\n\t\t\tIt Contains Special Charachters \U0001f620 \n"
	echo -e "\t\t==================================================="
	$HOME/DBMS/tableScripts/createTable.sh
fi
if [[ -f $tableName ]];then
    echo -e "\t\tThe Table Exist Choose another Name "
    $HOME/DBMS/tableScripts/tableMenu.sh 
fi
echo -e "\n\t\tEnter The Nunber of column: \c"
read coluNum

count=1
sep=":"
rsep="\n"
pKey=""
confData=""
while [ $count -le $coluNum ]

    do
        echo -e "\n\t\tEnter The Name of column.$count: \c"
        read coluName

        source $HOME/DBMS/checkSyntax.sh $coluName
        if [[ $? == 0 ]]; then
            
            echo -e "\n\n\n\n\n\n\n\n\n\n\n\n"
            echo -e "\n\t\t==================================================="
            echo -e "\n\t\t\tIt Contains Special Charachters \U0001f620 \n"
            echo -e "\t\t==================================================="
            continue
        fi
            echo -e "\n\t\tEnter The Type of column.$coluName\n"
            select var in "int" "str"
            do
                case $var in
                int ) coluType="int";break;;
                str ) coluType="str";break;;
                * )    echo -e "\t\tWrong Choice";;
                esac
            done
            if [[ $pKey == "" ]];then
                echo "Make It Primary Key ?"
                select var in "yes" "no"
                do
                    case $var in 
                        yes ) pKey="pk";confData+=$rsep$coluName$sep$coluType$sep$pKey;break;;
                        no  ) confData+=$rsep$coluName$sep$coluType$sep"";break;;
                        * )    echo -e "\t\tWrong Choice";;
                    esac
                done
            else
                confData+=$rsep$coluName$sep$coluType$sep""
            fi

            if [[ $count == $column ]];then
                temp=$temp$coluName
            else
                temp=$temp$coluName$sep
            fi
            ((count++))
    done
if [[ $pKey == "" ]];then
    confData+="pk"
fi


touch config_$tableName
echo -e $confData >> config_$tableName

touch $tableName
echo -e $temp >> $tableName

if [[ $? == 0 ]]
    then
    echo "The Table Created Successfully"
    $HOME/DBMS/tableScripts/tableMenu.sh 

else
    echo "Error in created The table"
    $HOME/DBMS/tableScripts/tableMenu.sh 
fi
