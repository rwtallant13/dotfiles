local apps = {
    terminal = "alacritty ",
    launcher = "rofi -show run ",
    switcher = require("widgets.alt-tab"),
    xrandr = "lxrandr",
    screenshot = "flameshot ",
    volume = "pavucontrol",
    appearance = "lxappearance",
    browser = "firefox ",
	incognito_browser = "firefox --new-window --private-window",
    fileexplorer = "thunar ",
    musicplayer = "pragha",
}

user = {
    terminal = "alacritty ",
    floating_terminal = "alacritty "
}

return apps
