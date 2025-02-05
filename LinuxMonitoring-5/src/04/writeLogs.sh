#!/bin/bash

declare -A background=(
    [1]="\033[107m" [2]="\033[41m" [3]="\033[42m"
    [4]="\033[44m"  [5]="\033[45m" [6]="\033[40m"
)

declare -A text=(
    [1]="\033[97m" [2]="\033[31m" [3]="\033[32m"
    [4]="\033[34m" [5]="\033[35m" [6]="\033[30m"
)

end="\e[0m"

arr=($First $Second $Third $Fourth)

for i in {0..3}; do
    if [[ -z ${arr[$i]} || ${arr[$i]} -lt 1 || ${arr[$i]} -gt 6 ]]; then
        arr[$i]=1 
        param[$i]=1
    fi
done

if [[ ${arr[0]} -eq ${arr[1]} ]]; then
    arr[1]=2
fi

if [[ ${arr[2]} -eq ${arr[3]} ]]; then
    arr[3]=2
fi


narr=("${background[${arr[0]}]}" "${text[${arr[1]}]}" "${background[${arr[2]}]}" "${text[${arr[3]}]}")

print_info() {
    local label=$1
    local value=$2
    echo -e "${narr[0]}${narr[1]}$label$end = ${narr[2]}${narr[3]}$value$end"
}

print_info "HOSTNAME" "$HOSTNAME"
print_info "TIMEZONE" "$TIMEZONE"
print_info "USER" "$USER"
print_info "OS" "$OS"
echo ""

columns=("Column 1 background" "Column 1 font color" "Column 2 background" "Column 2 font color")

for i in {0..3}; do
    if [[ ${param[$i]} == 1 ]]; then
        echo "${columns[$i]} = default ${color[$i]}"
    else
        echo "${columns[$i]} = ${arr[$i]} ${color[$i]}"
    fi
done


echo ""

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