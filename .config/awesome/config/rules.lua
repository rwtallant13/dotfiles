local awful = require("awful")
local beautiful = require("beautiful")

local keys = require("config.keys")

rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
				 	 -- Spawn windows as slave
					 callback = awful.client.setslave,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = keys.clientkeys,
                     buttons = keys.clientbuttons,
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

    { rule_any = {type = {  }
      }, properties = { titlebars_enabled = false }
    },

    { rule = { instance = "telegram-desktop"},
      properties = {screen = "DP-0", tag = "2",}},

    { rule = { instance = "Minecraft"},
      properties = {screen = "DP-0", requests_no_titlebar = true, maximized = true, tag = "8", switch_to_tags = "true", }},

    { rule = { name = "Media Viewer"},
      properties = {screen = "DP-0", tag = "2",}},

    { rule = { class = "discord"},
      properties = {screen = minscreen, tag = "9"}},

    { rule = { class = "Pavucontrol" },
      properties = { floating  = true },
      callback = function (c)
        c.width = 550
        c.height = 550
        awful.placement.top_right(c, {
          margins = {
            top = beautiful.bar_height + 5,
            right = 5
          }
        })
      end
    },

    { rule = { class = "Lxappearance" },
      properties = { floating  = true },
    },

    { rule = { instance = "floating_terminal" },
      properties = {
        floating  = true,
      },
    }
}

awful.rules.rules = rules
