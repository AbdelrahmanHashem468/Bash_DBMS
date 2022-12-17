#!/bin/bash 
if [[ $1 == *"/"* ]]; then
    return 0
fi
if [[ $1 == *"*"* ]]; then
    return 0
fi
if [[ $1 == *['!'@#\$%^\&*()_+]* ]] || [[ $dbName == [0-9]* ]]; then
    return 0
    else
    return 1
fi


