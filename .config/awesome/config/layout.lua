local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local bling = require("bling")


tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
	awful.layout.suit.tile,
    awful.layout.suit.tile.top,
	bling.layout.centered,
    awful.layout.suit.max,
    --awful.layout.suit.fair,
    --awful.layout.suit.magnifier,
    --awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.floating,
    --awful.layout.suit.tile.left,
    --awful.layout.suit.tile.bottom,
    --awful.layout.suit.fair.horizontal,
    --awful.layout.suit.spiral,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.corner.ne,
    --awful.layout.suit.corner.sw,
    --awful.layout.suit.corner.se,
-- bling layouts
	--bling.layout.equalarea,
	--bling.layout.mstab,
	--bling.layout.vertical,
	--bling.layout.horizontal,
    })
end)

--[[ Rounded corners
client.connect_signal("manage", function (c, startup)
    if not c.fullscreen and not c.maximized then
        c.shape = function(cr, width, height)
            gears.shape.rounded_rect(cr, width, height, beautiful.border_radius)
        end
    end
end)
-- Fullscreen clients should not have rounded corners
local function no_rounded_corners(c)
    if c.fullscreen or c.maximized then
        c.shape = function(cr, width, height)
            gears.shape.rectangle(cr, width, height)
        end
    else
        c.shape = function(cr, width, height)
            gears.shape.rounded_rect(cr, width, height, beautiful.border_radius)
        end
    end
end
client.connect_signal("property::fullscreen", no_rounded_corners)
client.connect_signal("property::maximized", function(c)
    no_rounded_corners(c)
end)

]]

awesome.connect_signal("tag::next", function(args)
    require("awful").tag.viewnext()
end)

awesome.connect_signal("tag::prev", function(args)
    require("awful").tag.viewprev()
end)

awesome.connect_signal("tag::movenext", function ()
        -- get current tag
        local t = client.focus and client.focus.first_tag or nil
        if t == nil then
            return
        end
        -- get next tag (modulo 9 excluding 0 to wrap from 9 to 1)
        local tag = client.focus.screen.tags[(t.name % 9) + 1]
        client.focus:move_to_tag(tag)
        awful.tag.viewnext()
    end)


awesome.connect_signal("tag::moveprev", function ()
        -- get current tag
        local t = client.focus and client.focus.first_tag or nil
        if t == nil then
            return
        end
        -- get next tag (modulo 9 excluding 0 to wrap from 9 to 1)
        local tag = client.focus.screen.tags[(t.name % 9) - 1]
        client.focus:move_to_tag(tag)
        awful.tag.viewprev()
    end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
     c:activate { context = "mouse_enter", raise = false }
end)

awful.screen.set_auto_dpi_enabled( true )

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
