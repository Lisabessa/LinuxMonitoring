#!/bin/bash

chmod +x show_colored_system_info.sh
chmod +x set_color.sh

if [ $# -ne 4 ]; then
    echo "There should be 4 parameters!"
    exit 1
else
    for color_num in $1 $2 $3 $4; do
        case "$color_num" in
        1 | 2 | 3 | 4 | 5 | 6) : ;;
        *) echo "Error! Each parameter must be a number from 1 to 6"
        exit 1;;
        esac
    done

    if [ "$1" -eq "$2" ] || [ "$3" -eq "$4" ]; then
    echo "Error! Same color for background and font"
       exit 1
    fi

    ./show_colored_system_info.sh $1 $2 $3 $4

fi
