#!/bin/bash

export TIMEZONE=$(timedatectl | awk '/Time zone:/ {gsub(/[(),]/, "", $4); print $3, "UTC", $4}')
# OS=$(cat /etc/*-release | grep 'DISTRIB_DESCRIPTION')
# OS=$(cat /etc/issue | awk '{print $1, $2, $3}')
export OS=$(hostnamectl | awk -F ': ' '/Operating System:/ {print $2}')
export DATE=$(date +"%d %B %Y %T")
export UPTIME=$(uptime --pretty | awk '{print $2, $3, $4, $5}' | tr '[:lower:]' '[:upper:]')
export UPTIME_SEC=$(cat /proc/uptime | awk '{print int ($1) " sec"}')
export IP=$(hostname -I | awk '{print $1 " ip"}' | tr '[:lower:]' '[:upper:]')
export MASK=$(netstat -rn | awk 'NR==4{print $3 " mask"}' | tr '[:lower:]' '[:upper:]') 
export GATEWAY=$(ip route show default | awk '/default via / {print $3 " default via gateway"}' | tr '[:lower:]' '[:upper:]')
export RAM_TOTAL=$(free -m | awk '/Mem:/{printf "%.3f GB", $2/1024}')
export RAM_USED=$(free -m | awk '/Mem:/{printf "%.3f GB", $3/1024}')
export RAM_FREE=$(free -m | awk '/Mem:/{printf "%.3f GB", $4/1024}')
export SPACE_ROOT=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $2/1024}')
export SPACE_ROOT_USED=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $3/1024}')
export SPACE_ROOT_FREE=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $4/1024}')

chmod +x writeLogs.sh
./writeLogs.sh