#!/bin/zsh

LOG_FILE="02.log"

while IFS= read -r line; do
    dir_path=$(echo "$line" | awk '{print $NF}')

    if [ -z "$dir_path" ]; then
        echo "Не удалось извлечь путь из строки: $line"
        continue
    fi

    if [ -d "$dir_path" ]; then
        if rmdir "$dir_path"; then
            echo "Папка удалена: $dir_path"
        else
            echo "Ошибка при удалении папки: $dir_path"
        fi
    else
        echo "Путь не существует или не является папкой: $dir_path"
    fi
done < "$LOG_FILE"

rm 02.log
rm error.log 
find ../../src/ -mindepth 1 -maxdepth 1 -type d \
! -regex ".*/\(01\|02\|03\|04\|05\|06\|07\|08\|09\)" -print0 | xargs -0 rm -rf