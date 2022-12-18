   if [[ $colKey == "pk" && $data =~ ^[`awk 'BEGIN{FS=":" ; ORS=" "}{if(NR != 1)print $(('$i'- 2))}' $tableName`]$ ]]; then
        echo -e "\n\t\t\t${RED}Duplcated key${NC}\n"
        echo -e "\n\t\t\t$colName ($colType) = \c"
        read data
        else
        break;
    fi