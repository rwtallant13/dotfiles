#!/usr/bin/bash
. /home/rob/.profile
# bspwm autostart
#/home/rob/.fehbg
#/usr/bin/nitrogen --restore
/home/rob/.bin/pbar.sh
/home/rob/.bin/start picom dunst dpms obs polkit
/home/rob/.bin/nvfans &
/home/rob/.bin/autolock enable &
/home/rob/.bin/mnt bb &
/home/rob/.bin/sinkctrl -r -d
/home/rob/.bin/caps2esc &
/usr/bin/clipmenud &
/usr/bin/nm-applet &
