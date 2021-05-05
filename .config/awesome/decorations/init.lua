--[[

Copyright (c) 2020 mut-ex <https://github.com/mut-ex>

The following code is a derivative work of the code from the awesome-wm-nice project
(https://github.com/mut-ex/awesome-wm-nice/), which is licensed MIT. This code therefore
is also licensed under the terms of the MIT License

]]--


local beautiful = require("beautiful")
local awful = require("awful")

local get_colors = require("lib.border_colors")

local add_decorations = function(c)
    local client_color = beautiful.bg_normal

    local args = get_colors(client_color)

    --[[local resize_button = {
        awful.widget.button(
            {}, 1, function()
                c:activate{context = "mouse_click", action = "mouse_resize"}
            end),
    }]]--

    -- https://www.reddit.com/r/awesomewm/comments/ggru8u/custom_rule_properties/
	require("decorations.top")(c, args)
	require("decorations.top")(c, args)
    require("decorations.right")(c, args)
    require("decorations.bottom")(c, args)

    -- Clean up
    collectgarbage("collect")
end

client.connect_signal("request::titlebars", function(c)
    add_decorations(c)
end)

-- Toggle titlebar on or off depending on s. Creates titlebar if it doesn't exist
local function setTitlebar(client, s)
    if s then
        if client.titlebar == nil then
            client:emit_signal("request::titlebars", "rules", {})
        end
        awful.titlebar.show(client)
    else
        awful.titlebar.hide(client)
    end
end

--Toggle titlebar on floating status change
client.connect_signal("property::floating", function(c)
    setTitlebar(c, c.floating)
end)

-- Hook called when a client spawns
client.connect_signal("manage", function(c)
    setTitlebar(c, c.floating or c.first_tag.layout == awful.layout.suit.floating)
end)

-- Show titlebars on tags with the floating layout
tag.connect_signal("property::layout", function(t)
    -- New to Lua ?
    -- pairs iterates on the table and return a key value pair
    -- I don't need the key here, so I put _ to ignore it
    for _, c in pairs(t:clients()) do
        if t.layout == awful.layout.suit.floating then
            setTitlebar(c, true)
        else
            setTitlebar(c, false)
        end
    end
end)
