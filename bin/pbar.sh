#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Show on all monitors. Systray icons always go in the main one
monitors=($(polybar -m | cut -d ':' -f 1))
main=0

for ((i=0; i<${#monitors[@]}; i++)); do
    if [ $i -eq $main ]; then
        export TRAY_POS=right
    fi

    2>/dev/null 1>&2 MONITOR=${monitors[$i]} polybar --reload pbar &

    if [ $i -eq $main ]; then
        unset TRAY_POS
    fi
done
