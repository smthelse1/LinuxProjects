#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Wrong number of arguments"
    exit 1
fi

if [[ "${1: -1}" != "/" ]]; then
    echo "Wrong path"
    exit 1
fi

if [[ $1 == "" ]];then
    echo "No path provided"
    exit 1
fi

export foldersQt=$(ls -lR "$1" | grep -c ^d)
export fiveFolders=$(du -h $1 | sort -hr | head -5 | nl -w1 -s'- ' | awk '{$2=$2; print $1, $3 ",", $2}')
export allFilesQt=$(ls -laR $1 | grep "^-" | wc | awk '{print $1}')
export configFileQt=$(find $1 -type f -name "*.conf" | wc -l)
export txtFileQt=$(find $1 -type f -name "*.txt" | wc -l)
export exeFileQt=$(find $1 -type f -executable | wc -l)
export logFileQt=$(find $1 -type f -name "*.log" | wc -l)
export zipFileQt=$(find $1 -type f -name "*.zip" -o -name "*.7z" -o -name "*.rar" -o -name "*.tar" | wc -l)
export SLFileQt=$(ls -lR $1 | grep "^l" | wc -l)
export tenFiles=$(find "$1" -type f -exec du -ah {} + | sort -rh | head -n 10 | nl -w1 -s'- ' | awk '{split($3, a, "."); print $1, $3 ",", $2 ",", a[length(a)]}')
export tenExecutableFiles=$(find "$1" -type f -executable -exec du -ah {} + | sort -rh | head -n 10 | nl -w1 -s'- ' | awk '{cmd="md5sum " $3; cmd | getline hash; close(cmd); split(hash, h, " "); print $1, $3 ",", $2 ",", h[1]}')

chmod +x writeLogs.sh
./writeLogs.sh 