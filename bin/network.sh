#!/bin/bash

# Display External TCP Connections by Application
function PCount {
    list=$(lsof -i tcp | awk '{count[$1]++}END{for(j in count) print ""count[j]"", j}')
    count=0
    output=""

    IFS=$'\n'
    for line in $list
    do
        _conn_count=$(echo $line | awk '{print $1}')
        _conn_app=$(echo $line | awk '{print $2}')
        if [[ $_conn_app != "COMMAND" && $_conn_app != "VBoxHeadl" ]]
        then
            count=`expr $count + $_conn_count`
            output="${output}${line}\n"
        fi
    done

    echo "External Connections"
    echo "=========================================="
    echo "$count Total"
    echo "=========================================="
    echo -e $output
}
