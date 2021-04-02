#!/usr/bin/bash
. /home/rob/.profile
# bspwm autostart
systemctl --user restart sxhkd.service &
/home/rob/.fehbg
/home/rob/bin/pbar.sh &
/home/rob/bin/caps2esc &
xsetroot -cursor_name left_ptr
/home/rob/bin/start picom nm-applet dunst polkit piavpn
/home/rob/bin/gpufans &
/home/rob/bin/monctl dpms
/usr/bin/clipmenud &
sleep 8s && /home/rob/bin/mnt bb &
