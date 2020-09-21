#!/usr/bin/bash
. /home/rob/.profile
# bspwm autostart
/home/rob/.bin/start picom &
/home/rob/.bin/start polybar &
/home/rob/.bin/start dunst &
/usr/bin/clipmenud &
/home/rob/.bin/set-dpms &
/home/rob/.bin/nvfans &
/home/rob/.bin/autolock enable &
/home/rob/.bin/mnt bb &
/home/rob/.bin/sinkctrl -r
/home/rob/.bin/sinkctrl -d &
/home/rob/.bin/ssr.sh launch
/home/rob/.bin/caps2esc &
/usr/bin/nm-applet &
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
