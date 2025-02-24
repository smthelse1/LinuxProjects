LANG=en_us_8859_1

chmod +x getAgent.sh
chmod +x getSizeOfPage.sh
chmod +x getIp.sh
chmod +x getMethod.sh
chmod +x getResponseCode.sh
chmod +x getUrl.sh
chmod +x newLogFile.sh

min=$(( 60 * 1 ))
n=0
day=$(date +%d)
datenow=$(date +%b/%Y)
b=1
for (( i=0; i<5; i++ ))
do
    logcount=$(((RANDOM%900) + 100))
    source newLogFile.sh
    for (( a=0; a<logcount; a++ ))
    do
        (( time += min ))
        date=$(date -d "@$time" '+%T')
        source getIp.sh
        source getMethod.sh
        source getUrl.sh
        source getResponseCode.sh
        source getAgent.sh 
        source getSizeOfPage.sh
    echo "$ip1"."$ip2"."$ip3"."$ip4" " - - "["$day"/"$datenow":"$date" +0000] '"'"$method" /"$url"/index.html HTTP/1.1'"' "$code" "$size" '"'-'"' '"'"Mozilla/5.0" "$agent"'"' >> access$b.log
    done
    (( day-- ))
    (( b++ ))
done