#!/usr/bin/env bash

#switch between two layouts (Us and Uk in this case)
current_layouts=$(setxkbmap -query | grep layout)

if [ "${current_layouts: -2}" = "us" ]; then
  setxkbmap -layout gb -variant extd -option caps:swapescape
else
  setxkbmap -layout us -variant intl -option caps:swapescape
fi

xset r rate 150 55
