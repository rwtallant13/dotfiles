local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local gears = require("gears")
local dpi = require('beautiful').xresources.apply_dpi

local apply_borders = require("lib.borders")

local createPopup = function(color)
    local icon = wibox.widget {
        font = "OverpassMono Nerd 24",
        align = "center",
        valign = "center",
        widget = wibox.widget.textbox
    }

    local progressbar = wibox.widget {
        value         = 1,
        color		  = color,
        background_color = beautiful.misc2,
        forced_width = dpi(100),
        shape = function(cr, width, height)
            gears.shape.rounded_rect(cr, width, height, beautiful.border_radius)
        end,
        forced_height  = dpi(5),
        widget        = wibox.widget.progressbar
    }

    local progressbar_container = wibox.widget {
        progressbar,
        direction     = 'east',
        layout        = wibox.container.rotate,
    }

    local widget = apply_borders({
        {
            {
                nil,
                progressbar_container,
                nil,
                expand = "none",
                layout = wibox.layout.align.horizontal
            },
            icon,
            spacing = dpi(4),
            layout = wibox.layout.fixed.vertical,
        },
        top = dpi(16),
        left = dpi(4),
        right = dpi(4),
        widget  = wibox.container.margin
    }, 30, 176, 6)

    local popup = awful.popup {
        widget = widget,
        y            = mouse.screen.geometry.height / 2 - 72,
        x            = mouse.screen.geometry.width - 48,
        shape        = function(cr, width, height)
            gears.shape.rounded_rect(cr, width, height, beautiful.border_radius)
        end,
        bg           = beautiful.bg_normal,
        ontop        = true,
        visible      = false,
    }

    popup:connect_signal("button::press", function() notyfi.visible = false end)

    local timer_die = timer { timeout = 3 }

    popup.show = function()
        if timer_die.started then
            timer_die:again()
        else
            timer_die:start()
        end

        popup.visible = true
    end

    -- Hide popup after timeout
    timer_die:connect_signal("timeout", function()
        popup.visible = false
        -- Prevent infinite timers events on errors.
        if timer_die.started then
            timer_die:stop()
        end
    end)

    popup.update = function(value, image)
        icon.markup = "<span foreground='"..beautiful.fg_normal.."'>"..image.."</span>"
        progressbar.value = value / 100
    end

    popup.updateValue = function(value)
        if value ~= nil then
            progressbar.value = progressbar.value + (value / 100)
        end
    end

    return popup
end

return createPopup
