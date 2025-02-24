#!/bin/bash

if [[ $# -ne 3 ]]; then
  echo "usage: $0 <dirshortname> <fileshortname> <filesize>"
  exit 1
fi

dirshortname=$1
fileshortname=$2
filesize=$3

is_number() {
  [[ $1 =~ ^[0-9]+$ ]]
}

if [[ ${#dirshortname} -lt 3 || ${#dirshortname} -gt 7 || ! $dirshortname =~ ^[a-zA-Z]+$ ]]; then
  echo "first argument error. It should be 3-7 English letters." >&2
  exit 1
fi

if echo "$dirshortname" | grep -qE '(.).*\1'; then
  echo "first argument error. Replace duplicate characters" >&2
  exit 1
fi

filename="${fileshortname%.*}"
ext="${fileshortname##*.}"
dot_count=$(echo -n "$fileshortname" | tr -cd '.' | wc -c)

if [[ $dot_count -ne 1 || ${#filename} -lt 4 || ${#filename} -gt 7 || ${#ext} -gt 3 || ${#ext} -eq 0 || ! $fileshortname =~ ^[a-zA-Z.]+$ ]]; then
  echo "second argument error. Invalid file name format." >&2
  exit 1
fi

declare -A chars
for (( i=0; i<${#filename}; i++ )); do
  char=${filename:$i:1}
  if [[ -n ${chars[$char]} ]]; then
    echo "second argument error. Replace duplicate characters!" >&2
    exit 1
  fi
  chars[$char]=1
done

size="${filesize%??}"
unit="${filesize: -2}"

if ! is_number "$size" || [[ $size -gt 100 || $unit != "Mb" ]]; then
  echo "third argument error. Size should be a number up to 100 and in KB (kb)." >&2
  exit 1
fi

filename2=$filename
echo "ARGUMENTS ACESS"