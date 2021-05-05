local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local naughty = require("naughty")
local bling = require("bling")

local hotkeys_popup = require("awful.hotkeys_popup")

-- Define mod key
local modkey = "Mod4"
local altkey = "Mod1"

local keys = {}
local apps = require("config.apps")

keys.desktopbuttons = gears.table.join(
    -- awful.button({ }, 1, function() awesome.emit_signal("dashboard::toggle") end)
    awful.button({ }, 4, awful.tag.viewprev),
    awful.button({ }, 5, awful.tag.viewnext)
)

keys.globalkeys = gears.table.join(

-- Standard programs applications --------------------------------------------
    awful.key({ modkey }, "Return",
		function () awful.spawn(apps.terminal) end,
        {description = "open a terminal", group = "launcher"}
	),

    awful.key({ modkey, "Shift" }, "Return",
		function () awful.spawn(user.terminal, {floating = true}) end,
              {description = "open a floating terminal", group = "launcher"}
	),

	awful.key({ modkey }, "g",
		function () awful.spawn("telegram-desktop") end,
        {description = "open telegram", group = "launcher"}
	),

	awful.key({ modkey }, "q",
		function () awful.spawn("qbittorrent") end,
        {description = "open qbittorrent", group = "launcher"}
	),

	awful.key({ modkey }, "d",
		function () awful.spawn("discord") end,
        {description = "open discord", group = "launcher"}
	),

	awful.key({ modkey }, "v",
		function () awful.spawn("clipmenu -p Copy -i") end,
        {description = "Clipboard manager", group = "launcher"}
	),

	awful.key({ modkey,           }, "b",
		function () awful.spawn(apps.browser) end,
        {description = "open browser", group = "launcher"}
	),

	awful.key({ modkey, altkey          }, "b",
		function () awful.spawn(apps.incognito_browser) end,
        {description = "open incognito browser", group = "launcher"}
	),

    awful.key({ altkey }, "space",
		function () awful.spawn(apps.launcher, false) end,
		{description = "Rofi run", group = "launcher"}
	),

    awful.key({ modkey }, "space",
		function () awful.spawn("opi -o", false) end,
		{description = "Search and Edit files", group = "launcher"}
	),

    awful.key({ }, "Print",
		function () awful.spawn(apps.screenshot .. "gui", false) end,
		{description = "Screenshot selection", group = "launcher"}
	),

    awful.key({"Control" }, "Print",
		function () awful.spawn("scrot win", false) end,
		{description = "Screenshot window", group = "launcher"}
	),

    awful.key({modkey }, "Print",
		function () awful.spawn(apps.screenshot .. "screen -c", false) end,
		{description = "Screenshot current screen", group = "launcher"}
	),

	awful.key({ modkey }, "m",
		function () awful.spawn(apps.terminal .. "-e zsh -ic 'vifm /home/rob/downloads/torrents /media/blueberry/'", false) end,
		{description = "Vifm for media", group = "launcher"}
	),

	awful.key({ modkey }, "f",
		function () awful.spawn(apps.terminal .. "-e zsh -ic 'vifm '", false) end,
		{description = "Vifm ", group = "launcher"}

	),

	awful.key({ modkey }, "BackSpace",
		function () awful.spawn("rofer -l" , false) end,
		{description = "Rofi Power menu ", group = "launcher"}

	),

	awful.key({ modkey }, "Home",
		function() awesome.emit_signal("dashboard::toggle") end,
			{description = "Toggle Dashboard ", group = "launcher"}

		),




-- awesome control ----------------------------------------

    awful.key({ modkey },            "r",     function ()
		awful.screen.focused().mypromptbox:run() end,
    		{description = "run prompt", group = "launcher"}),

	awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),

    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey,           }, "F1",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),

    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),
    awful.key({ altkey,           }, "Tab",
      function ()
          apps.switcher.switch( 1, "Mod1", "Alt_L", "Shift", "Tab")
      end),

    awful.key({ altkey, "Shift"   }, "Tab",
      function ()
          apps.switcher.switch(-1, "Mod1", "Alt_L", "Shift", "Tab")
      end),

	-- tabbed layout
	awful.key({"Mod1"}, "a",
                  function() bling.module.tabbed.pick_with_dmenu() end, {
            description = "pick client to add to tab group",
            group = "tabs"
	}),

	awful.key({"Mod1"}, "s", function()
            bling.module.tabbed.pick()
        end, {description = "iterate through tabbing group", group = "tabs"
	}),

    awful.key({"Mod1"}, "d", function() bling.module.tabbed.pop() end, {
            description = "remove focused client from tabbing group",
            group = "tabs"
    }),

    -- Layout manipulation

	-- Switch tags
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),

    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),

	awful.key({ modkey, altkey }, "Left",
      function ()
        -- get current tag
        local t = client.focus and client.focus.first_tag or nil
        if t == nil then
            return
        end
        -- get previous tag (modulo 9 excluding 0 to wrap from 1 to 9)
        local tag = client.focus.screen.tags[(t.name - 2) % 9 + 1]
        awful.client.movetotag(tag)
        awful.tag.viewprev()
    end,
        {description = "move client to previous tag and switch to it", group = "layout"}),

	awful.key({ modkey, altkey }, "Right",
      function ()
        -- get current tag
        local t = client.focus and client.focus.first_tag or nil
        if t == nil then
            return
        end
        -- get next tag (modulo 9 excluding 0 to wrap from 9 to 1)
        local tag = client.focus.screen.tags[(t.name % 9) + 1]
        awful.client.movetotag(tag)
        awful.tag.viewnext()
    end,
        {description = "move client to next tag and switch to it", group = "layout"}),

	-- focus direction

	awful.key({ "Mod1"}, "Down", function ()
		awful.client.focus.global_bydirection("down")
	end),

	awful.key({ "Mod1"}, "Up", function ()
		awful.client.focus.global_bydirection("up")
	end),

	awful.key({ "Mod1"}, "Right", function ()
		awful.client.focus.global_bydirection("right")
	end),

	awful.key({ "Mod1"}, "Left", function ()
		awful.client.focus.global_bydirection("left")
	end),

	-- Swap direction
	awful.key({ modkey, "Control"}, "Down", function ()
		awful.client.swap.global_bydirection("down")
	end,
    {description = "swap downwards client", group = "screen"}),

	awful.key({ modkey, "Control"}, "Up", function ()
		awful.client.swap.global_bydirection("up")
	end,
    {description = "swap upwards client", group = "screen"}),

	awful.key({ modkey, "Control"}, "Right", function ()
		awful.client.swap.global_bydirection("right")
	end,
    {description = "swap right client", group = "screen"}),

	awful.key({ modkey, "Control"}, "Left", function ()
		awful.client.swap.global_bydirection("left")
	end,
    {description = "swap left client", group = "screen"}),


    awful.key({ "Mod1", "Shift" }, "Right", function ()
		awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),

    awful.key({ "Mod1", "Shift" }, "Left", function ()
		awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),

    awful.key({ modkey,           }, "u",
		awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),

    -- master control
    awful.key({ modkey,           }, "l",
		function () awful.tag.incmwfact( 0.05) end,
              {description = "increase master width factor", group = "layout"}),

    awful.key({ modkey,           }, "h",
		function () awful.tag.incmwfact(-0.05) end,
              {description = "decrease master width factor", group = "layout"}),

    awful.key({ modkey,           }, "k",
		function () awful.tag.incmhfact( 0.05) end,
              {description = "increase master height factor", group = "layout"}),

    awful.key({ modkey,           }, "j",
		function () awful.tag.incmhfact(-0.05) end,
              {description = "decrease master height factor", group = "layout"}),

    awful.key({ modkey, "Shift"   }, "h",
		function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),

    awful.key({ modkey, "Shift"   }, "l",
		function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),

    awful.key({ modkey, "Control" }, "h",
		function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),

    awful.key({ modkey, "Control" }, "l",
		function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),

    -- switch layout
    awful.key({ modkey,   }, "Next",
	function () awful.layout.inc( 1) end,
              {description = "select next", group = "layout"}),

    awful.key({ modkey,   }, "Prior",
	function () awful.layout.inc(-1) end,
              {description = "select previous", group = "layout"}),


    -- media controls

    awful.key({}, "XF86AudioLowerVolume", function ()
        awful.spawn.easy_async_with_shell("/usr/bin/pamixer -d 4", function(stdout)
            awesome.emit_signal("popup::volume", {amount = -4})
        end)
    end),

    awful.key({}, "XF86AudioRaiseVolume", function ()
        awful.spawn.easy_async_with_shell("/usr/bin/pamixer -i 4", function(stdout)
            awesome.emit_signal("popup::volume", {amount = 4})
        end)
    end),

    awful.key({}, "XF86AudioMute", function ()
        awful.spawn.easy_async_with_shell("pamixer -t", function(stdout)
            awesome.emit_signal("popup::volume")
        end)
    end),

	awful.key({modkey}, "Insert", function ()
        awful.spawn.easy_async_with_shell("/home/rob/bin/sinkctrl -c")
    end),


    -- Brightness
   awful.key({ }, "XF86MonBrightnessDown", function ()
       awful.spawn.easy_async_with_shell("brightnessctl set 3%- > /dev/null", function(stdout)
           awesome.emit_signal("popup::brightness", {amount = -3})
       end)
   end),
   awful.key({ }, "XF86MonBrightnessUp", function ()
       awful.spawn.easy_async_with_shell("brightnessctl set +3% > /dev/null", function(stdout)
            awesome.emit_signal("popup::brightness", {amount = 3})
        end)
    end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    keys.globalkeys = gears.table.join(keys.globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"})
    )
end

keys.clientkeys = gears.table.join(
    awful.key({ modkey,           }, "F11",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),

    awful.key({ altkey    }, "F4",      function (c) c:kill() end,
              {description = "close", group = "client"}),

    awful.key({ modkey    }, "c",      function (c) c:kill() end,
              {description = "close", group = "client"}),

	awful.key({ modkey, "Shift" }, "t", bling.module.tabbed.pick() ),

    awful.key({ modkey, "Control" }, "f",
		function(c)
			awful.client.floating.toggle()
			c:raise()

		end,
		{description = "toggle floating", group = "client"}),

    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),

    awful.key({ modkey, "Shift" }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),

    awful.key({ modkey,           }, "n",
        function (c)
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    awful.key({ modkey,           }, "Up",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"})

)

keys.clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

root.keys(keys.globalkeys)
root.buttons(keys.desktopbuttons)

return keys