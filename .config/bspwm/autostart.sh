#!/usr/bin/bash
. /home/rob/.profile
# bspwm autostart
/home/rob/.bin/start-sxhkd
/home/rob/.bin/start-picom &
/home/rob/.bin/start-polybar &
/home/rob/.bin/start-dunst &
/home/rob/.bin/set-dpms &
/home/rob/.bin/nvfans &
/home/rob/.bin/autolock enable &
/home/rob/.bin/mnt bb &
/home/rob/.bin/sinkctrl -r
/home/rob/.bin/sinkctrl -d
/usr/bin/clipmenud &
/usr/bin/nm-applet &
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
