#!/bin/bash

chmod +x show_colored_system_info.sh
chmod +x set_color.sh

. ./colors.conf

export background1=$column1_background
export font1=$column1_font_color
export background2=$column2_background
export font2=$column2_font_color

default_background1=3
default_font1=2
default_background2=4
default_font2=5

if [ $# -ne 0 ]
then
    echo "There shouldn't be any parameters!"
    exit 1
fi

if [[ -z $background1 ]]
then
    background1=$default_background1
    flag_background1_default=1
fi

if [[ -z $font1 ]]
then
    font1=$default_font1
    flag_font1_default=1
fi

if [[ -z $background2 ]]
then
    background2=$default_background2
    flag_background2_default=1
fi

if [[ -z $font2 ]]
then
    font2=$default_font2
    flag_font2_default=1
fi

for color_num in $background1 $font1 $background2 $font2; do
    case "$color_num" in
    1 | 2 | 3 | 4 | 5 | 6) : ;;
    *) echo "Error! Each parameter must be a number from 1 to 6"
      exit 1;;
    esac
done

if [ "$background1" -eq "$font1" ] || [ "$background2" -eq "$font2" ]; then
    echo "Error! Same color for background and font"
    exit 1
fi

./show_colored_system_info.sh $background1 $font1 $background2 $font2
echo ""

get_color_name() {
  case ${1} in
  1) echo "(white)" ;;
  2) echo "(red)" ;;
  3) echo "(green)" ;;
  4) echo "(blue)" ;;
  5) echo "(purple)" ;;
  6) echo "(black)" ;;
  esac
}

if [[ $flag_background1_default != 1 ]]; then
    echo  "Column 1 background = $background1 $(get_color_name $background1)"
else
    echo  "Column 1 background = default $(get_color_name $background1)"
fi

if [[ $flag_font1_default != 1 ]]; then
    echo  "Column 1 font color = $font1 $(get_color_name $font1)"
else
    echo  "Column 1 font color = default $(get_color_name $font1)"
fi

if [[ $flag_background2_default != 1 ]]; then
    echo  "Column 2 background = $background2 $(get_color_name $background2)"
else
    echo  "Column 2 background = default $(get_color_name $background2)"
fi

if [[ $flag_font2_default != 1 ]]; then
    echo  "Column 2 font color = $font2 $(get_color_name $font2)"
else
    echo  "Column 2 font color = default $(get_color_name $font2)"
fi