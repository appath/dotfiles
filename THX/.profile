#!/bin/bash
# TERM colors
export TERM=rxvt-256color

# statusbar
while true; do
	if [ "$( xset -q | awk -F \" \" '/Group 2/ {print($4)}' )" = "on" ]; then
		LAYOUT="RU";
	else
		LAYOUT="EN";
	fi;

	xsetroot -name "$LAYOUT  $( date +"%a %d, %b %H:%M %p" )"
sleep 15s
done &
