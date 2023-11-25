#!/bin/bash

chmod +x show_directory_info.sh

if [ $# -ne 1 ]
then
    echo "There must be 1 parameter!"
    exit 1
elif [[ ! -d $1 ]]
then
    echo "No such directory!"
    exit 1
elif [[ ! $1 =~ .*\/$ ]]
then
    echo "Parameter must end by slash"
    exit 1
else
    ./show_directory_info.sh $1
fi
