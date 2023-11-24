#!/bin/bash

chmod +x show_system_info.sh

if [ $# -ne 0 ]; then
    echo "There shouldn't be any parameters!"
    exit 1
else
   bash show_system_info.sh
fi

read -p "Write the monitoring data to the file? (Y/N): " answer

case $answer in
y | Y)
    filename="$(date +"%d_%m_%y_%H_%M_%S").status"
    ./show_system_info.sh > $filename
    echo "Done";;
*) echo "The monitoring data weren't saved!";;
esac
