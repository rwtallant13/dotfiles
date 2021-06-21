local awful = require("awful")

awful.spawn.with_shell("xsetroot -cursor_name left_ptr", false)
awful.spawn("nm-applet --no-agent", false)
awful.spawn("/home/rob/bin/caps2esc", false)
awful.spawn("/home/rob/bin/mnt bb", false)
awful.spawn("/home/rob/bin/monctl dpms", false)
awful.spawn("/home/rob/bin/gpufans", false)


-- better run_once with pgrep
function run_once(cmd)
  findme = cmd
  firstspace = cmd:find(" ")
  if firstspace then
     findme = cmd:sub(0, firstspace-1)
	end
	awful.spawn.with_shell("pgrep -f -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
end
run_once("clipmenud >/dev/null")
run_once("mate-polkit >/dev/null")
run_once("piaclient")
run_once("picom --experimental-backends -b")
