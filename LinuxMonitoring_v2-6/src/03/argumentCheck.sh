#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo "usage: $0 <number(1-3)>"
  exit 1
fi

logfile=$1
if [[ ! "$logfile" =~ [1-3]+$ ]]; then
	echo "first argument error. need number 1 to 3."
	exit 1
	fi

if [[ "$logfile" -gt 4 ]]; then
	echo "first argument error. need number 1 to 3."
	exit 1
fi