#!/usr/bin/env bash

per=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d\: -f2 | awk '{print $1 * 100}')

icon() {

[ $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d\  -f3) = "[MUTED]" ] && echo "" && exit

if [ "$per" -gt "50" ]; then
	icon=""
elif [ "$per" -gt "0" ]; then
	icon=""
else
	icon=""
fi
echo "$icon"
}

percent() {
echo $per
}

[ "$1" = "icon" ] && icon && exit
[ "$1" = "percent" ] && percent && exit
exit

