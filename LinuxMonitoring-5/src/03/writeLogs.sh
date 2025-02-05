#!/bin/bash

colors[0]=$First;
colors[1]=$Second;
colors[2]=$Third;
colors[3]=$Fourth;


for i in 0 1 2 3; do
	if [[ ${colors[$i]} < 1 || ${colors[$i]} > 6 ]]; then
		echo "Wrong arguments"
		exit 1
	fi
done

if [[ ${colors[0]} == ${colors[1]} ]]; then
    echo "First and second arguments are equal"
    exit 1
fi

if [[ ${colors[2]} == ${colors[3]} ]]; then
    echo "Second and third arguments are equal"
    exit 1
fi


whiteF="\033[107m"
redF="\033[41m"
greenF="\033[42m"
blueF="\033[44m"
purpleF="\033[45m"
blackF="\033[40m"

end="\e[0m"

whiteT="\033[97m"
redT="\033[31m"
greenT="\033[32m"
blueT="\033[34m"
purpleT="\033[35m"
blackT="\033[30m"

print_info() {
    local label=$1
    local value=$2
    echo -e "${narr[0]}${narr[1]}$label$end = ${narr[2]}${narr[3]}$value$end"
}

for i in 0 2; do
    case ${colors[$i]} in
        1) narr[$i]=$whiteF ;;
        2) narr[$i]=$redF ;;
        3) narr[$i]=$greenF ;;
        4) narr[$i]=$blueF ;;
        5) narr[$i]=$purpleF ;;
        6) narr[$i]=$blackF ;;
    esac
done

for i in 1 3; do
    case ${colors[$i]} in
        1) narr[$i]=$whiteT ;;
        2) narr[$i]=$redT ;;
        3) narr[$i]=$greenT ;;
        4) narr[$i]=$blueT ;;
        5) narr[$i]=$purpleT ;;
        6) narr[$i]=$blackT ;;
    esac
done

print_info "HOSTNAME" "$HOSTNAME"
print_info "TIMEZONE" "$TIMEZONE"
print_info "USER" "$USER"
print_info "OS" "$OS"
print_info "DATE" "$DATE"
print_info "UPTIME" "$UPTIME"
print_info "UPTIME_SEC" "$UPTIME_SEC"
print_info "IP" "$IP"
print_info "MASK" "$MASK"
print_info "GATEWAY" "$GATEWAY"
print_info "RAM_TOTAL" "$RAM_TOTAL"
print_info "RAM_USED" "$RAM_USED"
print_info "RAM_FREE" "$RAM_FREE"
print_info "SPACE_ROOT" "$SPACE_ROOT"
print_info "SPACE_ROOT_USED" "$SPACE_ROOT_USED"
print_info "SPACE_ROOT_FREE" "$SPACE_ROOT_FREE"