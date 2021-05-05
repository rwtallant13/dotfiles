local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local apply_borders = require("lib.borders")

local size = 40
local radius = 8

return function(fg, fg_hover, text, onclick)
    local textbox = wibox.widget {
        markup = "<span foreground='"..fg.."'>"..text.."</span>",
        font = "OverpassMono Nerd 28",
        align = "center",
        valign = "center",
        forced_width = dpi(size),
        forced_height = dpi(size - (2 * radius)),
        widget = wibox.widget.textbox
    }

    local container = wibox.widget {
        textbox,
        bg = beautiful.bg_normal,
        widget = wibox.container.background
    }


    container:connect_signal("button::press", onclick)

    return apply_borders(container, size, size, radius)
end
