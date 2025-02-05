#!/bin/bash

if [ $# -gt 1 ]; then
  echo "ERROR: Too many arguments"
  exit 1
else
if [[ $1 =~ ^[0-9]+$ ]]; then #[0-9]
  echo "Error: Input must be a positive integer."
  else 
  echo "${1:-No input provided}"
  fi
fi

#cat h.txt | sed 's/ /\n/'