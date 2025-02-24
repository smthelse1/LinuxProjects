#!/bin/bash

c=0
len1=${#dirshortname}
len2=${#filename}

for (( i=0, v=0; i < dircount; i++, v++ ))
do
    if [[ $v -eq $len1 ]]; then
        v=0
        if [[ $c -eq $len1 ]]; then
            c=0
        fi
        (( c = v + c ))
        word1=${dirshortname:c:1}
        (( c++ ))
        dirshortname="$dirshortname$word1"
    fi

    source spaceCheck.sh
    word1=${dirshortname:v:1}
    date1=$(date +%d%m%y)
    log_date1=$(date +%F)

    mkdir "$pathfolder"/"$dirshortname""$word1"_"$date1" 2>> error.log
    echo "$log_date1"" ""$pathfolder"/"$dirshortname""$word1"_"$date" >> 01.log

    filename=$filename2

    b=0
    for (( j=0, a=0; j < $filecount; j++, a++ ))
    do
    if [[ $a -eq $len2 ]]; then
    a=0
        if [[ $b -eq $len2 ]]; then
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
        log_date2=$(date +%F)

        touch "$pathfolder"/"$dirshortname""$word1"_"$date1"/"$filename""$word2"_"$date2"."$ext" 2>> error.log
        fallocate -l "$filesize"K "$pathfolder"/"$dirshortname""$word1"_"$date1"/"$filename""$word2"_"$date2"."$ext" 2>> error.log
        echo "$log_date2""   ""$pathfolder"/"$dirshortname""$word1"_"$date1"/"$filename""$word2"_"$date2"."$ext""   ""$filesize"KB >> 01.log

    done
done