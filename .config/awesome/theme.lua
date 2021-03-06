---------------------------
-- custom awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local themes_path = "~/.config/awesome/"
local gears = require("gears")

local icon_path = "~/.config/awesome/icons/"

local theme = {}

theme.font          = "Roboto Medium 10"
theme.titlefont          = "Roboto Bold 10"
theme.fontname          = "Roboto Medium 10"

theme.hotkeys_font = "OverpassMono Nerd 11"
theme.hotkeys_description_font = "Roboto 11"
theme.hotkeys_modifiers_fg = "#ebcb8b"
theme.hotkeys_group_margin = dpi(30)

-- general
theme.notification_width = 200
theme.notification_opacity = 0.75
theme.useless_gap   = dpi(5)
theme.rounded_corners = false

-- terminal colors
theme.blue = "#88c0d0"
theme.blue_light = "#3FC6DE"
theme.cyan = "#59E3E3"
theme.cyan_light = "#6BE6E6"
theme.green = "#29D398"
theme.green_light = "#3FDAA4"
theme.purple = "#EE64AE"
theme.purple_light = "#F075B7"
theme.red = "#E95678"
theme.red_light = "#EC6A88"
theme.yellow = "#FAB795"
theme.yellow_light = "#FBC3A7"

-- Background colors
theme.bg_dark = "#29343d"
theme.bg_normal = "#1a2026"
theme.bg_focus = "#29343d"
theme.bg_urgent = "#3b4b58"
theme.bg_minimize = "#3b4b58"

-- Foreground Colors
theme.fg_normal = "#ffffff"
theme.fg_focus = "#a3b8ef"
theme.fg_urgent = "#bf616a"
theme.fg_minimize = "#3b4b58"
theme.button_close = "#f9929b"

-- Borders
theme.border_width = dpi(2)
theme.border_normal = "#29343d"
theme.border_focus = "#d8dee9"
theme.border_marked = "#5e81ac"
theme.border_radius = dpi(12)
theme.client_radius = dpi(12)
theme.widget_border_width = dpi(2)
theme.widget_border_color =  "#29343d"
theme.border_radius = dpi(6)

-- wibar
theme.wibar_height = dpi(38) + theme.widget_border_width
theme.wibar_margin = dpi(15)
theme.wibar_spacing = dpi(15)
theme.wibar_bg = "#1a2026"
theme.bg_systray = "#29343d"
theme.systray_icon_size = 20
theme.systray_icon_spacing = 3

--tasklist
theme.tasklist_font = "Roboto 11"
theme.tasklist_plain_task_name = true
theme.tasklist_bg_normal = "#29343d"
theme.tasklist_fg_focus = "#ffffff"
theme.tasklist_bg_urgent = "#29343d"

-- regular
theme.titlebar_close_button_normal = icon_path.."titlebar/close/close_1.png"
theme.titlebar_close_button_focus = icon_path.."titlebar/close/close_2.png"
theme.titlebar_maximized_button_normal_inactive = icon_path.."titlebar/maximize/maximize_1.png"
theme.titlebar_maximized_button_focus_inactive  = icon_path.."titlebar/maximize/maximize_2.png"
theme.titlebar_maximized_button_normal_active = icon_path.."titlebar/maximize/maximize_3.png"
theme.titlebar_maximized_button_focus_active  = icon_path.."titlebar/maximize/maximize_3.png"
theme.titlebar_minimize_button_normal = icon_path.."titlebar/minimize/minimize_1.png"
theme.titlebar_minimize_button_focus  = icon_path.."titlebar/minimize/minimize_2.png"

-- hover
theme.titlebar_close_button_normal_hover = icon_path.."titlebar/close/close_3.png"
theme.titlebar_close_button_focus_hover = icon_path.."titlebar/close/close_3.png"
theme.titlebar_maximized_button_normal_inactive_hover = icon_path.."titlebar/maximize/maximize_3.png"
theme.titlebar_maximized_button_focus_inactive_hover  = icon_path.."titlebar/maximize/maximize_3.png"
theme.titlebar_maximized_button_normal_active_hover = icon_path.."titlebar/maximize/maximize_3.png"
theme.titlebar_maximized_button_focus_active_hover  = icon_path.."titlebar/maximize/maximize_3.png"
theme.titlebar_minimize_button_normal_hover = icon_path.."titlebar/minimize/minimize_3.png"
theme.titlebar_minimize_button_focus_hover  = icon_path.."titlebar/minimize/minimize_3.png"

theme.wallpaper = themes_path.."wallpaper.png"
theme.wallpaper_blur = themes_path.."wallpaper_blur.png"

-- You can use your own layout icons like this:
theme.layout_fairh = icon_path.."layouts/fairhw.png"
theme.layout_fairv = icon_path.."layouts/fairvw.png"
theme.layout_floating  = icon_path.."layouts/floatingw.png"
theme.layout_magnifier = icon_path.."layouts/magnifierw.png"
theme.layout_max = icon_path.."layouts/maxw.png"
theme.layout_fullscreen = icon_path.."layouts/fullscreenw.png"
theme.layout_tilebottom = icon_path.."layouts/tilebottomw.png"
theme.layout_tileleft   = icon_path.."layouts/tileleftw.png"
theme.layout_tile = icon_path.."layouts/tilew.png"
theme.layout_tiletop = icon_path.."layouts/tiletopw.png"
theme.layout_spiral  = icon_path.."layouts/spiralw.png"
theme.layout_dwindle = icon_path.."layouts/dwindlew.png"
theme.layout_cornernw = icon_path.."layouts/cornernww.png"
theme.layout_cornerne = icon_path.."layouts/cornernew.png"
theme.layout_cornersw = icon_path.."layouts/cornersww.png"
theme.layout_cornerse = icon_path.."layouts/cornersew.png"

-- Icons
theme.avatar = icon_path.."avatar.png"
theme.battery_alert_icon = icon_path.."battery_alert.png"
theme.notification_icon = icon_path.."notification.png"
theme.search_icon = icon_path.."search.png"
theme.search_grey_icon = icon_path.."search_grey.png"
theme.next_icon = icon_path.."next.png"
theme.next_grey_icon = icon_path.."next_grey.png"
theme.previous_icon = icon_path.."previous.png"
theme.previous_grey_icon = icon_path.."previous_grey.png"
theme.camera_icon = icon_path.."camera.png"

return theme
