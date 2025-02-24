#!/bin/bash

#while true; do
CPU_USAGE=$(LC_NUMERIC="C" awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else print ($2+$4-u1) * 100 / (t-t1); }' <(grep 'cpu ' /proc/stat) <(sleep 1;grep 'cpu ' /proc/stat))
MEM_TOTAL=$(cat /proc/meminfo | grep "MemTotal" | grep -E -e [0-9]+ -o)
MEM_FREE=$(cat /proc/meminfo | grep "MemFree" | grep -E -e [0-9]+ -o)
MEM_AVAILABLE=$(cat /proc/meminfo | grep "MemAvailable" | grep -E -e [0-9]+ -o)
DISK_USED=$(df / | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $3}')
DISK_AVAILABLE=$(df / | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $4}')

> metrics.txt
> metrics.html

echo "# HELP cpu_usage Get CPU usage" | tee -a metrics.txt metrics.html
echo "# TYPE cpu_usage gauge" | tee -a metrics.txt metrics.html
echo "cpu_usage ${CPU_USAGE}" | tee -a metrics.txt metrics.html
echo "# HELP mem_total Get total mem" | tee -a metrics.txt metrics.html
echo "# TYPE mem_total gauge" | tee -a metrics.txt metrics.html
echo "mem_total $MEM_TOTAL" | tee -a metrics.txt metrics.html
echo "# HELP mem_free Get free mem" | tee -a metrics.txt metrics.html
echo "# TYPE mem_free gauge" | tee -a metrics.txt metrics.html
echo "mem_free $MEM_FREE" | tee -a metrics.txt metrics.html
echo "# HELP mem_available Get mem available" | tee -a metrics.txt metrics.html
echo "# TYPE mem_available gauge" | tee -a metrics.txt metrics.html
echo "mem_available $MEM_AVAILABLE" | tee -a metrics.txt metrics.html
echo "# HELP disk_used Get disk used" | tee -a metrics.txt metrics.html
echo "# TYPE disk_used gauge" | tee -a metrics.txt metrics.html
echo "disk_used $DISK_USED" | tee -a metrics.txt metrics.html
echo "# HELP disk_available Get disk available" | tee -a metrics.txt metrics.html
echo "# TYPE disk_available gauge" | tee -a metrics.txt metrics.html
echo "disk_available $DISK_AVAILABLE" | tee -a metrics.txt metrics.html

# if ! [ -d "/var/www/html/metrics" ] ; then
#    sudo mkdir /var/www/html/metrics
# fi

sudo cat metrics.txt > /var/www/html/metrics.txt
sudo cat metrics.html > /var/www/html/metrics.html

#sudo -u $(who | awk '{print $1}') DISPLAY=:0 xdotool search --onlyvisible --class "firefox" windowactivate --sync key F5
#sleep 3
#done
