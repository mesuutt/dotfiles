#!/bin/bash

# Get focused window title for showing in i3block


id=$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')
name=$(xprop -id $id | awk '/_NET_WM_NAME/{$1=$2="";print}' | cut -d'"' -f2)

if [[ $(echo $name | wc -c) -ge 70 ]];then
    # Show fist 70 characters of focused window
    name=${name:0:70}
    name="$name..."
fi

#echo "$name | $line" || exit 1
echo "$name" || exit 1
