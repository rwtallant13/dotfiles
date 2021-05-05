local awful = require("awful")
local gears = require("gears")
local gfs = gears.filesystem
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local get_taglist = function(s)
    -- Taglist buttons
    local taglist_buttons = gears.table.join(
        awful.button({}, 1,
            function(t) t:view_only()
		end),

--[[        awful.button({modkey}, 1, function(t)
            if client.focus then client.focus:move_to_tag(t) end
        end),
--]]
		awful.button({}, 3, awful.tag.viewtoggle),

--[[        awful.button({modkey}, 3, function(t)
            if client.focus then client.focus:toggle_tag(t) end
        end),
--]]
		awful.button({}, 5, function(t)
        	awful.tag.viewnext(t.screen)
        end),

		awful.button({}, 4, function(t)
            awful.tag.viewprev(t.screen)
        end))


local markup = function(tag) return "<span foreground='#aaaaaa'>  "..tag.name.."  </span>" end
local markup_hover = function(tag) return "<span foreground='#ffffff'>  "..tag.name.."  </span>" end


local update_tag = function(item, tag, index)
	item.visible = #tag:clients() > 0 or tag.selected

	local textbox = item:get_children_by_id('text_tag')[1]
	local selected_indicator = item:get_children_by_id('selected_indicator')[1]

	selected_indicator.visible = tag.selected

	if tag.selected then
		textbox.markup = markup_hover(tag)
	else
		textbox.markup = markup(tag)
	end
end

    local taglist = awful.widget.taglist {

        screen = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons,
        widget_template = {
            {
                nil,
                {
                    font = "Roboto Medium 12",
                    id = "text_tag",
                    widget = wibox.widget.textbox,
                },
                {
                    {
                        bg = beautiful.red,
                        id = "selected_indicator",
                        widget = wibox.container.background
                    },
                    forced_height = 1,
                    widget = wibox.container.background
                },
                layout = wibox.layout.align.vertical
            },
            id     = 'background_role',
            widget = wibox.container.background,
            create_callback = function(item, tag, index, _)
                update_tag(item, tag, index)
            end,
			update_callback = update_tag
        },
    }

    local container = wibox.widget {
        taglist,
        spacing = 6,
        layout = wibox.layout.fixed.horizontal
    }
    return container
end

return get_taglist
