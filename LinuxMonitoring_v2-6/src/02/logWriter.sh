#!/bin/bash

coutfile=1
v=0
c=0

for url in $array; do
    if [[ $coutfile -eq 100 ]]; then
    dateend=$(date +%s)
	datetotal=$((dateend-datestart))
	echo "Completion-$(date +"%D-%T"). The script's running time is $datetotal seconds." >> 02.log
	echo "Start-$datestartscript. Completion-$(date +"%D-%T"). The script's running time is $datetotal seconds." 
    exit 0;
    fi 

    if [[ $v -eq ${#dirshortname} ]]; then
    v=0
        if [[ $c -eq ${#dirshortname} ]]; then
        c=0
        fi
    c=$v+$c
    word1=${dirshortname:c:1}
    ((c++))
    dirshortname="$dirshortname$word1"
    fi

source spaceCheck.sh
word1=${dirshortname:v:1}
date1=$(date +%d%m%y)
log_date1=$(date +%F)
mkdir "$url"/"$dirshortname""$word1"_"$date1" 2>> error.log
echo "$log_date1"" ""$url"/"$dirshortname""$word1"_"$date1" >> 02.log
filename=$filename2

b=0

for (( j=0, a=0; j < $coutfile; j++, a++ ))
do
    if [[ ! -d "$url"/"$dirsortname""$word1"_"date1" ]]; then
    continue
    fi
    if [[ $a -eq ${#filename} ]]; then
    a=0
        if [[ $b -eq ${#filename} ]]; then
        b=0
        fi
    b=$a+$b
    word2=${filename:b:1}
    ((b++))
    filename="$filename$word2"
    fi

source spaceCheck.sh
word2=${filename:a:1}
date2=$(date +%d%m%y)
log_date2=${date +%F}
touch "$url"/"$dirsortname""$word1"_"$date1"/"$filename""$word2"_"$date2"."$ext" 2>> error.log
fallocate -l "$filesize"M "$url"/"$dirsortname""$word1"_"$date1"/"$filename""$word2"_"$date2"."$ext" 2> error.log
echo ""$log_date2""    ""$url"/"$dirsortname""$word1"_"$date1"/"$filename""$word2"_"$date2"."$ext"	"$filesize""MB"" >> 02.log

done

if [[ ! -d "$url"/"$dirshortname""$word1"_"$date1" ]]; then
((a--))
continue
fi
((v++))
((coutfile++))
done
dateend=$(date +%s)
datetotal=$((dateend-datestart))
echo "Completion-$(date +"%D-%T"). The script's running time is $datetotal seconds." >> 02.log
echo "Start-$datestartscript. Completion-$(date +"%D-%T"). The script's running time is $datetotal seconds." 