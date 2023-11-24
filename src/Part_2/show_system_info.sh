#!/bin/bash

show_system_info(){
    echo "HOSTNAME = $(hostname)"
    echo "TIMEZONE = $(timedatectl show --property=Timezone --value)"
    echo "USER = $USER"
    echo "OS = $(uname -s) $(uname -r)"
    echo "DATE = $(date +"%d %B %Y %T")"
    echo "UPTIME = $(uptime -p)"
    echo "UPTIME_SEC = $(($(date +%s) - $(date -d "$(uptime -s)" +%s)))"
    echo "IP = $(hostname -I)"
    echo "MASK = $(ifconfig | grep "inet" | grep "broadcast" | awk '{print $4}' | head -1)"
    echo "GATEWAY = $(ip r | awk '/default/ {print $3}')"
    echo "RAM_TOTAL = $(free --bytes | awk '/Mem/{printf "%.3f", $2/1024/1024/1024}') GB"
    echo "RAM_USED = $(free --bytes | awk '/Mem/{printf "%.3f", $3/1024/1024/1024}') GB"
    echo "RAM_FREE = $(free --bytes | awk '/Mem/{printf "%.3f", $4/1024/1024/1024}') GB"
    echo "SPACE_ROOT = $(df -k | grep '/$' | awk '{printf "%.2f", $2/1024}') MB"
    echo "SPACE_ROOT_USED = $(df -k | grep '/$' | awk '{printf "%.2f", $3/1024}') MB"
    echo "SPACE_ROOT_FREE = $(df -k | grep '/$' | awk '{printf "%.2f", $4/1024}') MB"
}

echo "$(show_system_info)"