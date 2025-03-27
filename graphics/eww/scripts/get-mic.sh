#!/usr/bin/env bash

per=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | cut -d\: -f2 | awk '{print $1 * 100}')

icon() {

[ $(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | cut -d\  -f3) = "[MUTED]" ] && echo "" && exit

echo ""
}

percent() {
echo $per
}

[ "$1" = "icon" ] && icon && exit
[ "$1" = "percent" ] && percent && exit
exit


