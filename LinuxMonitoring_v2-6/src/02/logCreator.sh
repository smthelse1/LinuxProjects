#!/bin/bash

cat /dev/null > 02.log
cat /dev/null > error.log
echo "Start-$(date +"%D-%T")" >> 02.log
datestart=$(date +%s)
datestartscript=$(date +"%D-%T")