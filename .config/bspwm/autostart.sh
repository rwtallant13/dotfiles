#!/usr/bin/bash
. /home/rob/.profile
# bspwm autostart
/home/rob/.fehbg
/home/rob/bin/pbar.sh &
/home/rob/bin/start picom nm-applet dunst polkit pia-vpn
/home/rob/bin/gpufans &
/home/rob/bin/mnt bb &
/home/rob/bin/monctl dpms
/home/rob/bin/caps2esc &
/usr/bin/clipmenud &
xsetroot -cursor_name left_ptr
