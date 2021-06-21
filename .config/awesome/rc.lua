-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
-- Declarative object management
local ruled = require("ruled")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
package.loaded["awful.hotkeys_popup.keys.tmux"] = {}
package.loaded["awful.hotkeys_popup.keys.vim"] = {}
package.loaded["awful.hotkeys_popup.keys.firefox"] = {}

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
        message = message
    }
end)
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(awful.util.getdir("config") .. "theme.lua" )

-- This is used later as the default terminal and editor to run.
terminal = "alacritty "
floating_terminal = "alacritty --class floating "
editor =  "nvim "
editor_cmd = terminal .. " -e " .. editor
launcher = "rofi -show run "
xrandr = "lxrandr "
screenshot = "flameshot "
volume = "pavucontrol "
appearance = "lxappearance "
browser = "firefox "
incognito_browser = "firefox --new-window --private-window "
fileexplorer = "thunar "

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

-- {{{ Tag
-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.tile,
		awful.layout.suit.floating,
		awful.layout.suit.magnifier,
		awful.layout.suit.fair.horizontal,
		--awful.layout.suit.fair,
		--awful.layout.suit.tile.bottom,
		--awful.layout.suit.max,
		--awful.layout.suit.spiral.dwindle,
		--awful.layout.suit.tile.left,
		--awful.layout.suit.tile.top,
		--awful.layout.suit.spiral,
		--awful.layout.suit.max.fullscreen,
		--awful.layout.suit.corner.nw,
		--awful.layout.suit.corner.ne,
		--awful.layout.suit.corner.sw,
		--awful.layout.suit.corner.se,
    })
end)
-- }}}

--Rounded corners
client.connect_signal("manage", function (c, startup)
	if beautiful.rounded_corners == true then
		if not c.fullscreen and not c.maximized then
			c.shape = function(cr, width, height)
				gears.shape.rounded_rect(cr, width, height, beautiful.border_radius)
			end
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


-- tags
awful.screen.connect_for_each_screen(function(s)

	layouts = awful.layout.layouts
	tags = {
	  settings = {
		{ names  = { "1", "2", "3", "4", "5", "6", "7", "8", "9" },
		  layout = {
			  layouts[1],
			  layouts[1],
			  layouts[1],
			  layouts[1],
			  layouts[1],
			  layouts[1],
			  layouts[1],
			  layouts[1],
			  layouts[1],
		  }
		},
		{ names  = { "1", "2", "3", "4", "5", "6", "7", "8", "9"},
		  layout = {
			  layouts[1],
			  layouts[1],
			  layouts[1],
			  layouts[1],
			  layouts[1],
			  layouts[1],
			  layouts[1],
			  layouts[1],
			  layouts[1],
		  }
	}}}

	tags[s] = awful.tag(tags.settings[s.index].names, s, tags.settings[s.index].layout)
	-- Wallpaper for each screen
    set_wallpaper(s)
end)

-- Wibar
require("wibar")

-- Key bindings
require("keys")

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
				 	 -- Spawn windows as slave
					 callback = awful.client.setslave,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_offscreen,
                     size_hints_honor = false
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "xtightvncviewer",
          "feh",
        },

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},


    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "floating", "dialog" }
      }, properties = { titlebars_enabled = true }
    },

    { rule_any = {type = {  }},
	  properties = { titlebars_enabled = false }
    },

    { rule = { instance = "telegram-desktop"},
      properties = {screen = "DP-0", tag = "2",}
    },

    { rule = { instance = "Minecraft"},
      properties = {screen = "DP-0", tag = "8", switch_to_tags = "true", }
    },

    { rule = { class = "discord"},
      properties = {screen = "DP-0", tag = "9"}
    },

	{ rule = { instance = "floating" },
	  properties = { floating  = true, placement = awful.placement.centered },
	},

    { rule = { class = "Pavucontrol" },
      properties = { floating  = true },
      callback = function (c)
        c.width = 550
        c.height = 550
        awful.placement.top_right(c, {
          margins = {
            top = beautiful.wibar_height + 5,
            right = 5
          }
        })
      end
    },

    { rule = { class = "Lxappearance" },
      properties = { floating  = true },
    }
}

-- }}}

-- {{{ Titlebars

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

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = {
        awful.button({ }, 1, function()
            client.focus = c
            awful.mouse.client.move(c)
            c:raise()
        end),
        awful.button({ }, 3, function()
            client.focus = c
            c:raise()
            awful.mouse.client.resize(c)
        end)
    }

    awful.titlebar(c).widget = {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
				font = beautiful.font,
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
--            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
			awful.titlebar.widget.minimizebutton(c),
--            awful.titlebar.widget.stickybutton   (c),
--            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

-- {{{ Notifications

ruled.notification.connect_signal('request::rules', function()
    -- All notifications will match this rule.
    ruled.notification.append_rule {
        rule       = { },
        properties = {
            screen           = awful.screen.preferred,
            implicit_timeout = 5,
        }
    }
end)

naughty.connect_signal("request::display", function(n)
    naughty.layout.box { notification = n }
end)

-- }}}

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus",
	function(c)
	if awful.client.marked then
		c.border_color = beautiful.border_marked
	else
		c.border_color = beautiful.border_normal
	end
		--c.border_color = beautiful.border_normal

	end
)

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

-- autorun programs
--awful.spawn.with_shell("~/.config/awesome/autorun.sh")
require("autorun")
