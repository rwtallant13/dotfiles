#!/bin/bash
#

_toggle() {
    msgId="999"
    STATUS="$(ps axco command | grep -w '^[r]edshift' | grep -v "red.sh" | wc -l)"
    ps axco command | grep -w '^[r]edshift' | grep -v "redshift.sh"
    if [[ $STATUS -eq 0 ]]; then
        dunstify -a "redshift" -r "$msgId" "Redshift" "<b>On</b>"
        redshift -c "${1:-"~/.config/redshift/dim.conf"}" > /dev/null 2>&1 & disown
    elif [[ $STATUS -gt 0 ]]; then
        dunstify -a "redshift" -r "$msgId" "Redshift" "<b>Off</b>"
        redshift -x && killall redshift
    fi
}

_start() {
    killall -q redshift

    # Wait until the processes have been shut down
    while pgrep -x redshift >/dev/null; do sleep 1; done

    sleep 1s && redshift-gtk -c /home/rob/.config/redshift/redshift.conf &
}


if [[ "$1" == "-t" ]]; then
    _toggle $2
    exit 0
else
    _start
    exit 0
fi
