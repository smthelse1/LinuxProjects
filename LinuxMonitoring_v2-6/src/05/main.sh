#!/bin/bash

if [[ -z "$1" ]]; then
    echo "usage: $0 <number(1-4)>"
    exit 1
fi

logfile=$1

for i in {1..5}; do
    if [[ ! -e "../04/access$i.log" ]]; then
        echo "error: log file access$i.log doesnt exists."
        exit 1
    fi
done

echo "all log files exists. script running."

content=$(cat ../04/access{1..5}.log 2>/dev/null)

case $logfile in 
    1)
        > 05-1.log
        for code in 200 201 400 401 403 404 500 501 502 503; do
            echo "$content" | while IFS= read -r line; do
                log_code=$(echo "$line" | awk '{print $9}')
                if [[ "$log_code" == "$code" ]]; then
                    echo "$line" >> 05-1.log
                fi
            done
        done
        ;;
    2)
        > 05-2.log
        echo "$content" | awk '{print $1}' | sort | uniq -c >> 05-2.log
        ;;
    3)
       > 05-3.log
        for code in 400 401 403 404 500 501 502 503; do
            echo "$content" | while IFS= read -r line; do
                log_code=$(echo "$line" | awk '{print $9}')
                if [[ "$log_code" == "$code" ]]; then
                    echo "$line" >> 05-3.log
                fi
            done
        done
        ;;
    4)
        > 05-4.log
        echo "$content" | while IFS= read -r line; do
            code=$(echo "$line" | awk '{print $9}')
            if [[ "$code" =~ ^4[0-9][0-9]$ || "$code" =~ ^5[0-9][0-9]$ ]]; then
                echo "$line" | awk '{print $1}' | sort | uniq -c >> 05-4.log
            fi
        done
        ;;
    *)
        echo "error argument. need number from 1 to 4"
        exit 1
        ;;
esac