#!/bin/bash

COLOR=./set_color.sh

echo $($COLOR $1 $2) "HOSTNAME = $($COLOR $3 $4) $(hostname) $($COLOR 0 0)"
echo $($COLOR $1 $2) "TIMEZONE = $($COLOR $3 $4) $(timedatectl show --property=Timezone --value) $($COLOR 0 0)"
echo $($COLOR $1 $2) "USER = $($COLOR $3 $4) $USER $($COLOR 0 0)"
echo $($COLOR $1 $2) "OS = $($COLOR $3 $4) $(uname -s) $(uname -r) $($COLOR 0 0)"
echo $($COLOR $1 $2) "DATE = $($COLOR $3 $4) $(date +"%d %B %Y %T") $($COLOR 0 0)"
echo $($COLOR $1 $2) "UPTIME = $($COLOR $3 $4) $(uptime -p) $($COLOR 0 0)"
echo $($COLOR $1 $2) "UPTIME_SEC = $($COLOR $3 $4) $(($(date +%s) - $(date -d "$(uptime -s)" +%s))) $($COLOR 0 0)"
echo $($COLOR $1 $2) "IP = $($COLOR $3 $4) $(hostname -I) $($COLOR 0 0)"
echo $($COLOR $1 $2) "MASK = $($COLOR $3 $4) $(ifconfig | grep "inet" | grep "broadcast" | awk '{print $4}' | head -1) $($COLOR 0 0)"
echo $($COLOR $1 $2) "GATEWAY = $($COLOR $3 $4) $(ip r | awk '/default/ {print $3}') $($COLOR 0 0)"
echo $($COLOR $1 $2) "RAM_TOTAL = $($COLOR $3 $4) $(free --bytes | awk '/Mem/{printf "%.3f", $2/1024/1024/1024}') GB $($COLOR 0 0)"
echo $($COLOR $1 $2) "RAM_USED = $($COLOR $3 $4) $(free --bytes | awk '/Mem/{printf "%.3f", $3/1024/1024/1024}') GB $($COLOR 0 0)"
echo $($COLOR $1 $2) "RAM_FREE = $($COLOR $3 $4) $(free --bytes | awk '/Mem/{printf "%.3f", $4/1024/1024/1024}') GB $($COLOR 0 0)"
echo $($COLOR $1 $2) "SPACE_ROOT = $($COLOR $3 $4) $(df -k | grep '/$' | awk '{printf "%.2f", $2/1024}') MB $($COLOR 0 0)"
echo $($COLOR $1 $2) "SPACE_ROOT_USED = $($COLOR $3 $4) $(df -k | grep '/$' | awk '{printf "%.2f", $3/1024}') MB $($COLOR 0 0)"
echo $($COLOR $1 $2) "SPACE_ROOT_FREE = $($COLOR $3 $4) $(df -k | grep '/$' | awk '{printf "%.2f", $4/1024}') MB $($COLOR 0 0)"