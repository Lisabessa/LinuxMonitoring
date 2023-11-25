#!/bin/bash

startScriptTime="$(date +%s.%N)"
echo -e "\033[42mTotal number of folders (including all nested ones) = $(du $1| wc -l)\033[0m"
echo -e "\033[46mTOP 5 folders of maximum size arranged in descending order (path and size):\033[0m"  
du $1 -h 2>/dev/null | sort -hr | head -5 | awk '{print $2"  ", $1}' |nl
echo -e "\033[42mTotal number of files = " $(find $1 -type f 2>/dev/null | wc -l)'\033[0m'
echo -e "\033[46mNumber of:\033[0m"
echo "Configuration files (with .conf extension) = " $(find $1 -name "*.conf"  2>/dev/null | wc -l)
echo "Text files (with .txt extension) = " $(find $1 -name "*.txt"  2>/dev/null | wc -l)
echo "Executable files = " $(find $1 -type f -name "*.exe"  2>/dev/null | wc -l)
echo "Log files (with the extension .log) = " $(find $1 -name "*.log"  2>/dev/null | wc -l)
echo "Archive files = " $(find $1 -name '*.tar' -o -name '*.zip' -o -name '*.7z' -o -name '*.rar' -o -name '*.gz'  2>/dev/null | wc -l)
echo "Symbolic links = " $(find $1 -type l  2>/dev/null | wc -l)
echo -e "\033[46mTOP 10 files of maximum size arranged in descending order (path, size and type):\033[0m"
filepaths=($(find $1 -type f -exec du -h {} +  2>/dev/null | sort -hr | head -10 | awk '{print $2}'))
filesizes=($(find $1 -type f -exec du -h {} +  2>/dev/null | sort -hr | head -10 | awk '{print $1}'))
for ((i = 0; i < 10; i++)); do
    if [[ ! -z ${filepaths[$i]} ]]; then
    echo "$((i+1)) - ${filepaths[$i]}, ${filesizes[$i]}, ${filepaths[$i]##*.}"
    fi
done
echo -e "\033[46mTOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)\033[0m"
execfiles=($(find $1 -type f -name "*.exe" -exec du -h {} +  2>/dev/null | sort -hr | head -10 | awk '{print $2}'))
counter=1
for filepath in ${execfiles[*]}
do
    echo "$counter - "$(find $filepath -type f -exec du -h {} +  2>/dev/null | awk '{printf "%s, %s", $2, $1}')b, $(md5sum $filepath | awk '{print $1}')
    counter=$(( $counter + 1 ))
done
finishScriptTime="$(date +%s.%N)"
echo $startScriptTime $finishScriptTime | awk '{printf "Script execution time (in seconds) = %.5f\n", $2 - $1}'
