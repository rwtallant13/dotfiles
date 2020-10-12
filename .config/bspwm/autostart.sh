#!/usr/bin/bash
. /home/rob/.profile
# bspwm autostart
#/home/rob/.fehbg
#/usr/bin/nitrogen --restore
/home/rob/.bin/start picom polybar dunst dpms ssr
/home/rob/.bin/nvfans &
/home/rob/.bin/autolock enable &
/home/rob/.bin/mnt bb &
/home/rob/.bin/sinkctrl -r -d
/home/rob/.bin/caps2esc &
/usr/bin/clipmenud &
/usr/bin/nm-applet &
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
