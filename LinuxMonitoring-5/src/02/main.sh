#!/bin/bash

if [ $# != 0 ]; then
kill $$
fi

if command -v netstat >/dev/null 2>&1; then
    echo -e "\e[1;35m$(echo "netstat downloaded" | tr [:lower:] [:upper:])\e[0m"
else 
    echo -e "\e[1;35m$(echo "netstat not installed" | tr [:lower:] [:upper:])\e[0m"
    kill $$
fi

TIMEZONE=$(timedatectl | awk '/Time zone:/ {gsub(/[(),]/, "", $4); print $3, "UTC", $4}')
# OS=$(cat /etc/*-release | grep 'DISTRIB_DESCRIPTION')
# OS=$(cat /etc/issue | awk '{print $1, $2, $3}')
OS=$(hostnamectl | awk -F ': ' '/Operating System:/ {print $2}')
DATE=$(date +"%d %B %Y %T")
UPTIME=$(uptime --pretty | awk '{print $2, $3, $4, $5}' | tr '[:lower:]' '[:upper:]')
UPTIME_SEC=$(cat /proc/uptime | awk '{print int ($1) " sec"}')
IP=$(hostname -I | awk '{print $1 " ip"}' | tr '[:lower:]' '[:upper:]')
MASK=$(netstat -rn | awk 'NR==4{print $3 " mask"}' | tr '[:lower:]' '[:upper:]') 
GATEWAY=$(ip route show default | awk '/default via / {print $3 " default via gateway"}' | tr '[:lower:]' '[:upper:]')
RAM_TOTAL=$(free -m | awk '/Mem:/{printf "%.3f GB", $2/1024}')
RAM_USED=$(free -m | awk '/Mem:/{printf "%.3f GB", $3/1024}')
RAM_FREE=$(free -m | awk '/Mem:/{printf "%.3f GB", $4/1024}')
SPACE_ROOT=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $2/1024}')
SPACE_ROOT_USED=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $3/1024}')
SPACE_ROOT_FREE=$(df /root/ | awk '/\/$/ {printf "%.2f MB", $4/1024}')

echo $HOSTNAME
echo $TIMEZONE
echo $USER
echo $OS
echo $DATE
echo $UPTIME
echo $UPTIME_SEC
echo $IP
echo $MASK
echo $GATEWAY
echo $RAM_TOTAL
echo $RAM_USED
echo $RAM_FREE
echo $SPACE_ROOT
echo $SPACE_ROOT_USED
echo $SPACE_ROOT_FREE

chmod +x writeLogs.sh
./writeLogs.sh