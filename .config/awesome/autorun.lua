local awful = require("awful")

awful.spawn("picom --experimental-backends -b", false)
awful.spawn("nm-applet --no-agent", false)
awful.spawn("/usr/bin/clipmenud", false)
awful.spawn("1>/dev/null /bin/mate-polkit", false)
awful.spawn("/opt/piavpn/bin/pia-client --quiet", false)
awful.spawn("/home/rob/bin/caps2esc", false)
awful.spawn("/home/rob/bin/mnt bb", false)
awful.spawn("xsetroot -cursor_name left_ptr", false)
awful.spawn("/home/rob/bin/monctl dpms", false)
awful.spawn("/home/rob/bin/gpufans", false)