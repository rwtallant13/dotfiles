#!/usr/bin/bash
. /home/rob/.profile
# bspwm autostart
/home/rob/bin/pbar.sh &
/home/rob/.fehbg
/home/rob/bin/start sxhkd
/home/rob/bin/start picom
/home/rob/bin/start nm-applet dunst polkit piavpn
/home/rob/bin/caps2esc &
xsetroot -cursor_name left_ptr &
/home/rob/bin/gpufans &
/home/rob/bin/monctl dpms &
/usr/bin/clipmenud &
sleep 8s && /home/rob/bin/mnt bb &
