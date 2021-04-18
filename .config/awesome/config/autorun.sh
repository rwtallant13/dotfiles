#!/usr/bin/env bash

function run {
  if ! pgrep -f "$*" ;
  then
    $@&
  fi
}

run picom --experimental-backends -b
run nm-applet --no-agent
run /usr/bin/clipmenud
run /opt/piavpn/bin/pia-client --quiet &
run /usr/lib/mate-polkit/polkit-mate-authentication-agent-1
run /home/rob/bin/caps2esc
run xsetroot -cursor_name left_ptr
run /home/rob/bin/gpufans
run /home/rob/bin/monctl dpms
run sleep 8s && /home/rob/bin/mnt bb
