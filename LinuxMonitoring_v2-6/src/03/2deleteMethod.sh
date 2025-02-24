#!/bin/bash

echo -e "enter the start date of creation accurate to the second (YYYY-MM-DD HH:MI:SS)"
read first_date

echo -e "enter the end date of creation accurate to the second (YYYY-MM-DD HH:MI:SS)"
read last_date

if [[ -z "$first_date" || -z "$last_date" ]]; then
    echo "wrong parameters"
    exit 1
fi

echo "script is running."

v=0

for url in $(find / -name '*_*' -type d -not -path  '*sbin*' -not -path '*bin*' -newerct "$firstdate" ! -newerct "$secondate" 2>/dev/null)
	do
		((v++))
		echo "$url" >> 03.log
		rm -rf "$url";
	done