#!/bin/bash

cd ../02/

LOG_FILE="02.log"

while IFS= read -r line; do
    dir_path=$(echo "$line" | awk '{print $NF}')

    if [ -z "$dir_path" ]; then
        echo "Не удалось извлечь путь из строки: $line" >> ../03/03.log
        continue
    fi

    if [ -d "$dir_path" ]; then
        if rmdir "$dir_path"; then
            echo "Папка удалена: $dir_path" >> ../03/03.log
        else
            echo "Ошибка при удалении папки: $dir_path" >> ../03/03.log
        fi
    else
        echo "Путь не существует или не является папкой: $dir_path" >> ../03/03.log
    fi
done < "$LOG_FILE"

# rm 02.log
# rm error.log 
# rm ../03/03.log
# find ../../src/ -mindepth 1 -maxdepth 1 -type d \
# ! -regex ".*/\(01\|02\|03\|04\|05\|06\|07\|08\|09\)" -print0 | xargs -0 rm -rf