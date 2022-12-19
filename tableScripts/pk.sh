   

    if [[ $data =~ ^[awk 'BEGIN{FS=":" ; OS=" "}{if(NR != 1)print $1}' $tableName
]]; then
        echo -e "\n\t\t\t${RED}Duplcated key${NC}\n"
        echo -e "\n\t\t\t$colName ($colType) = \c"
        read data
        else
        break;
    fi
