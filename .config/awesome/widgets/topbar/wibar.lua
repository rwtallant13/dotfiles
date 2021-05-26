
-- wibar.lua
-- Wibar (top bar)
local awful = require("awful")
local gears = require("gears")
local gfs = require("gears.filesystem")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local helpers = require("helpers")

local systray_margin = (beautiful.wibar_height - beautiful.systray_icon_size) / 2

-- Awesome Panel -----------------------------------------------------------

local icon1 = wibox.widget {
    widget = wibox.widget.imagebox,
    resize = true
}

local awesome_icon = wibox.widget {
    {
        icon1,
        top = dpi(5),
        bottom = dpi(5),
        left = dpi(10),
        right = dpi(5),
        widget = wibox.container.margin
    },
    bg = "#29343d",
    widget = wibox.container.background
}

awesome_icon:buttons(gears.table.join(awful.button({}, 1, function()
    awesome.emit_signal("widgets::start::toggle", mouse.screen)
end)))

--[[ awesome.connect_signal("widgets::start::status", function(status)
    if not status then
        icon1.image = unclicked
    else
        icon1.image = clicked
    end
end)
--]]



-- Date Widget ----------------------------------------------------------------

local date_text = wibox.widget {
    font = "OverpassMono Nerd 12",
    format = "%m/%d/%y",
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textclock
}

date_text.markup = "<span foreground='" .. "#88c0d0" .. "'>" ..
                       date_text.text .. "</span>"

date_text:connect_signal("widget::redraw_needed", function()
    date_text.markup = "<span foreground='" .. "#88c0d0" .. "'>" ..
                           date_text.text .. "</span>"
end)

local date_icon = wibox.widget {
    font = "OverpassMono Nerd 12",
    markup = "<span foreground='" .. "#88c0d0" .. "'></span>",
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

local date_pill = wibox.widget {
    {
        date_icon,
        helpers.horizontal_pad(10),
        {date_text, top = dpi(1), widget = wibox.container.margin},
        layout = wibox.layout.fixed.horizontal
    },
    left = dpi(10),
    right = dpi(10),
    widget = wibox.container.margin
}

-- Time Widget ----------------------------------------------------------------

local time_text = wibox.widget {
    font = "OverpassMono Nerd 12",
    format = "%l:%M %P",
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textclock
}

time_text.markup = "<span foreground='" .. "#ccaced" .. "'>" ..
                       time_text.text .. "</span>"

time_text:connect_signal("widget::redraw_needed", function()
    time_text.markup = "<span foreground='" .. "#ccaced" .. "'>" ..
                           time_text.text .. "</span>"
end)

local time_icon = wibox.widget {
    font = "OverpassMono Nerd 12",
    markup = "<span foreground='" .. "#ccaced" .. "'></span>",
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

local time_pill = wibox.widget {
    {
        time_icon,
        helpers.horizontal_pad(10),
        {time_text, top = dpi(1), widget = wibox.container.margin},
        layout = wibox.layout.fixed.horizontal
    },
    left = dpi(10),
    right = dpi(10),
    widget = wibox.container.margin
}

-- Systray Widget -------------------------------------------------------------

local mysystray = wibox.widget.systray()
mysystray:set_base_size(24)


local mysystray_container = {
    mysystray,
    left = dpi(4),
    right = dpi(4),
    widget = wibox.container.margin
}

-- Create the Wibar -----------------------------------------------------------

screen.connect_signal("request::desktop_decoration", function(s)
    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create layoutbox widget
    s.mylayoutbox = awful.widget.layoutbox(s)

    -- Create the wibox
    s.mywibox = awful.wibar({position = "top", screen = s, type = "dock",  bg = beautiful.wibar_bg .. "00", height = "34"})

    -- Remove wibar on full screen
    local function remove_wibar(c)
        if c.fullscreen or c.maximized then
            c.screen.mywibox.visible = false
        else
            c.screen.mywibox.visible = true
        end
    end

    -- Remove wibar on full screen
    local function add_wibar(c)
        if c.fullscreen or c.maximized then
            c.screen.mywibox.visible = true
        end
    end

    -- Hide bar when a splash widget is visible
    awesome.connect_signal("widgets::splash::visibility", function(vis)
        screen.primary.mywibox.visible = not vis
    end)

    client.connect_signal("property::fullscreen", remove_wibar)

    client.connect_signal("request::unmanage", add_wibar)

    -- Create the taglist widget
    s.mytaglist = require("widgets.topbar.taglist")(s)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen = s,
	    font = "OverpassMono Nerd 12",
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
        style = {
            shape = helpers.rrect(beautiful.border_radius),
            shape_border_width = beautiful.widget_border_width,
            shape_border_color = beautiful.widget_border_color
        },
        layout = {spacing = 10, layout = wibox.layout.fixed.horizontal},
        widget_template = {
            {
                {
                    {id = 'text_role', widget = wibox.widget.textbox},
                    layout = wibox.layout.flex.horizontal
                },
                left = dpi(12),
                right = dpi(12),
                widget = wibox.container.margin
            },
            id = 'background_role',
			list_update,
            widget = wibox.container.background
        }
    }

    local final_systray = wibox.widget {
        {mysystray_container, top = dpi(2), layout = wibox.container.margin},
        bg = "#29343d",
		shape = helpers.rrect(beautiful.border_radius - 3),
        widget = wibox.container.background
    }

    -- Add widgets to the wibox
    s.mywibox:setup{
        layout = wibox.layout.align.vertical,
        nil,
        {
            layout = wibox.layout.align.horizontal,
            expand = "none",
            {
                layout = wibox.layout.fixed.horizontal,
                {
                    {
                        {
                            --awesome_icon,
                            s.mytaglist,
                            spacing = 15,
                            spacing_widget = {
                                color = "#3b4b58",
                                shape = gears.shape.powerline,
                                widget = wibox.widget.separator
                            },
                            layout = wibox.layout.fixed.horizontal
                        },
                        bg = "#29343d",
                        shape = helpers.rrect(beautiful.border_radius - 3),
                        widget = wibox.container.background
                    },
                    top = dpi(6),
                    left = dpi(10),
                    right = dpi(5),
                    --bottom = dpi(6),
                    widget = wibox.container.margin
                },
                s.mypromptbox,
            },
            {
                {
                    {
                        s.mytasklist,
                        bg = "#29343d" .. "00",
                        shape = helpers.rrect(beautiful.border_radius - 3),
                        widget = wibox.container.background
                    },
                    top = dpi(6),
                    left = dpi(5),
                    --bottom = dpi(6),
                    right = dpi(5),
                    widget = wibox.container.margin,
                },
				width = 800,
                widget = wibox.container.constraint
            },
            {
                {
                    {
                        time_pill,
                        bg = "#29343d",
                        shape = helpers.rrect(beautiful.border_radius - 3),
                        widget = wibox.container.background
                    },
                    top = dpi(6),
                    left = dpi(5),
                    --bottom = dpi(6),
                    right = dpi(5),
                    widget = wibox.container.margin
                },

                {
                    {
                        date_pill,
                        bg = "#29343d",
                        shape = helpers.rrect(beautiful.border_radius - 3),
                        widget = wibox.container.background
                    },
                    top = dpi(6),
                    left = dpi(5),
                    --bottom = dpi(6),
                    right = dpi(5),
                    widget = wibox.container.margin
                },
                {
                    awful.widget.only_on_screen(final_systray, screen[1]),
                    top = dpi(6),
                    left = dpi(5),
                    --bottom = dpi(6),
                    right = dpi(5),
                    widget = wibox.container.margin
                },
                {
                    {
                        {
                            s.mylayoutbox,
                            top = dpi(4),
                            bottom = dpi(4),
                            right = dpi(7),
                            left = dpi(7),
                            widget = wibox.container.margin
                        },
                        bg = "#29343d",
                        shape = helpers.rrect(beautiful.border_radius - 3),
                        widget = wibox.container.background
                    },
                    top = dpi(6),
                    --bottom = dpi(6),
                    left = dpi(5),
                    right = dpi(10),
                    widget = wibox.container.margin
                },

                layout = wibox.layout.fixed.horizontal
            }
        }

    }
end)

-- EOF ------------------------------------------------------------------------