#!/bin/bash

text=$1
if [[ $# != 1 ]] || [[ $text =~ ^[0-9]+$ ]]
then
echo "Incorrect input"
else
echo "Input: $text"
fi