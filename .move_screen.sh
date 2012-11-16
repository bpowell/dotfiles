#!/bin/bash

LINE=`xrandr -q --screen $1 | grep Screen`
WIDTH=`echo ${LINE} | awk '{ print $8 }'`
HEIGHT=`echo ${LINE} | awk '{ print $10 }' | awk -F"," '{ print $1 }'`

X=$(($WIDTH / 2))
Y=$(($HEIGHT / 2))

xdotool mousemove --screen $1 $X $Y
