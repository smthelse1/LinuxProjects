#!/bin/bash

read -p "Wanna write logs into file?(Y/N) " log

if [[ $log == Y || $log == y ]]; then
    name=$(date +"%d_%m_%y_%H_%M_%S").status #name=$(date +"%d_%m_%y_%H_%M_%S").status
    ./main.sh > $name &
    exit 0
else
    exit 0
fi