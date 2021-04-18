local apps = {
    terminal = "alacritty",
    launcher = "rofi -show run",
    switcher = require("widgets.alt-tab"),
    xrandr = "lxrandr",
    screenshot = "flameshot gui",
    volume = "pavucontrol",
    appearance = "lxappearance",
    browser = "firefox",
    fileexplorer = "thunar",
    musicplayer = "pragha",
    settings = "code /home/parndt/awesome/"
}

user = {
    terminal = "alacritty",
    floating_terminal = "alacritty"
}

return apps
