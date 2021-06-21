-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")


local hotkeys_popup = require("awful.hotkeys_popup")

-- Default modkey.
modkey = "Mod4"
altkey = "Mod1"

-- {{{ Mouse bindings
awful.mouse.append_global_mousebindings({
    awful.button({ }, 4, awful.tag.viewprev),
    awful.button({ }, 5, awful.tag.viewnext),
})
-- }}}

-- {{{ Key bindings

-- personal bindings

awful.keyboard.append_global_keybindings({
	awful.key({ modkey }, "Return",
		function ()
			awful.spawn(terminal)
		end,
        {description = "open a terminal", group = "launcher"}
	),

	awful.key({ modkey, altkey }, "Return",
		function ()
			awful.spawn(floating_terminal)
		end,
        {description = "open a floating terminal", group = "launcher"}
	),

	awful.key({ modkey }, "g",
		function ()
			awful.spawn("quiet telegram-desktop")
		end,
        {description = "open telegram", group = "launcher"}
	),

	awful.key({ modkey }, "d",
		function ()
			awful.spawn("quiet discord")
		end,
        {description = "open discord", group = "launcher"}
	),

	awful.key({ modkey }, "v",
		function ()
			awful.spawn("clipmenu -p Copy -i")
		end,
        {description = "Clipboard manager", group = "launcher"}
	),

	awful.key({ modkey}, "b",
		function ()
			awful.spawn("quiet " .. browser)
		end,
        {description = "open browser", group = "launcher"}
	),

	awful.key({ modkey, altkey}, "b",
		function ()
			awful.spawn("quiet " .. incognito_browser)
		end,
        {description = "open incognito browser", group = "launcher"}
	),

    awful.key({ altkey }, "space",
		function ()
			awful.spawn(launcher, false)
		end,
		{description = "Rofi run", group = "launcher"}
	),

    awful.key({ modkey }, "space",
		function ()
			awful.spawn("opi -o", false)
		end,
		{description = "Search and Edit files", group = "launcher"}
	),

    awful.key({ }, "Print",
		function ()
			awful.spawn(screenshot .. " gui", false)
		end,
		{description = "Screenshot selection", group = "launcher"}
	),

    awful.key({"Control" }, "Print",
		function ()
			awful.spawn("scrot win", false)
		end,
		{description = "Screenshot window", group = "launcher"}
	),

    awful.key({modkey }, "Print",
		function ()
			awful.spawn(screenshot .. " screen -c", false)
		end,
		{description = "Screenshot current screen", group = "launcher"}
	),

	awful.key({ modkey }, "m",
		function ()
			awful.spawn(terminal .. "-e zsh -ic 'vifm /home/rob/downloads/ /drives/blueberry/'", false)
		end,
		{description = "Vifm for media", group = "launcher"}
	),

	awful.key({ modkey }, "BackSpace",
		function ()
			awful.spawn("rofer -l")
		end,
		{description = "Rofi Power menu ", group = "launcher"}
	),

	awful.key({ modkey }, "F1",
		function ()
			awful.spawn("/home/rob/bin/red.sh -t /home/rob/.config/redshift/dim.conf" )
		end,
		{description = "Toggle Redshift", group = "launcher"}
	),
})

-- General Awesome keys
awful.keyboard.append_global_keybindings({
    awful.key({ modkey, "Control" }, "r",
		awesome.restart,
        {description = "reload awesome", group = "awesome"}
	),

	awful.key({ modkey,           }, "h",
		hotkeys_popup.show_help,
        {description="show help", group="awesome"}
	),

	awful.key({ modkey, "Shift"   }, "q",
		awesome.quit,
    	{description = "quit awesome", group = "awesome"}
	),
})

-- Tags related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ modkey }, "Escape",
		awful.tag.history.restore,
        {description = "go back", group = "tag"}
	),

	awful.key({ modkey }, "Tab",
		function ()
			awful.spawn("/home/rob/bin/rofi-mvwin" )
		end,
		{description = "Select window from rofi", group = "launcher"}
	),

	awful.key({ altkey }, "Tab",
		function ()
			-- awful.client.focus.history.previous()
			awful.client.focus.byidx(-1)
			if client.focus then
				client.focus:raise()
			end
		end),

	awful.key({ altkey, "Shift" }, "Tab",
		function ()
			-- awful.client.focus.history.previous()
			awful.client.focus.byidx(1)
			if client.focus then
				client.focus:raise()
			end
		end),

	awful.key({ modkey }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),

    awful.key({ modkey }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),

	awful.key({ modkey, "Shift"}, "Left",
      function ()
        -- get current tag
        local t = client.focus and client.focus.first_tag or nil
        if t == nil then
            return
        end
        -- get previous tag (modulo 9 excluding 0 to wrap from 1 to 9)
        local tag = client.focus.screen.tags[(t.name - 2) % 9 + 1]
        client.focus:move_to_tag(tag)
    end,
        {description = "move client to previous tag", group = "layout"}),

	awful.key({ modkey, "Shift" }, "Right",
      function ()
        -- get current tag
        local t = client.focus and client.focus.first_tag or nil
        if t == nil then
            return
        end
        -- get next tag (modulo 9 excluding 0 to wrap from 9 to 1)
        local tag = client.focus.screen.tags[(t.name % 9) + 1]
        client.focus:move_to_tag(tag)
    end,
        {description = "move client to next tag", group = "layout"}),

	awful.key({ modkey, altkey }, "Left",
      function ()
        -- get current tag
        local t = client.focus and client.focus.first_tag or nil
        if t == nil then
            return
        end
        -- get previous tag (modulo 9 excluding 0 to wrap from 1 to 9)
        local tag = client.focus.screen.tags[(t.name - 2) % 9 + 1]
        client.focus:move_to_tag(tag)
        awful.tag.viewprev()
    end,
        {description = "move client to previous tag and follow", group = "layout"}),

	awful.key({ modkey, altkey }, "Right",
      function ()
        -- get current tag
        local t = client.focus and client.focus.first_tag or nil
        if t == nil then
            return
        end
        -- get next tag (modulo 9 excluding 0 to wrap from 9 to 1)
        local tag = client.focus.screen.tags[(t.name % 9) + 1]
        client.focus:move_to_tag(tag)
        awful.tag.viewnext()
    end,
        {description = "move client to next tag and follow", group = "layout"}),
})

-- Focus related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ altkey}, "Down",
		function ()
			awful.client.focus.global_bydirection("down")
		end,
		{description = "focus down", group = "focus"}),

	awful.key({ altkey}, "Up",
		function ()
			awful.client.focus.global_bydirection("up")
		end,
		{description = "focus up", group = "focus"}),

	awful.key({ altkey}, "Right",
		function ()
			awful.client.focus.global_bydirection("right")
		end,
		{description = "focus right", group = "focus"}),

	awful.key({ altkey}, "Left",
		function ()
			awful.client.focus.global_bydirection("left")
		end,
		{description = "focus left", group = "focus"}),

	awful.key({ modkey }, "Up",
		function ()
			awful.screen.focus_relative( 1)
		end,
		{description = "focus the next screen", group = "focus"}),

    awful.key({ modkey }, "Down",
		function ()
			awful.screen.focus_relative(-1)
		end,
        {description = "focus the previous screen", group = "focus"}),
})

-- Layout related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ modkey, "Control"}, "Down",
		function ()
			awful.client.swap.global_bydirection("down")
		end,
		{description = "swap downwards client", group = "layout"}),

	awful.key({ modkey, "Control"}, "Up",
		function ()
			awful.client.swap.global_bydirection("up")
		end,
		{description = "swap upwards client", group = "layout"}),

	awful.key({ modkey, "Control"}, "Right",
		function ()
			awful.client.swap.global_bydirection("right")
		end,
		{description = "swap right client", group = "layout"}),

	awful.key({ modkey, "Control"}, "Left",
		function ()
			awful.client.swap.global_bydirection("left")
		end,
		{description = "swap left client", group = "layout"}),

    awful.key({ modkey,           }, ".",
		function ()
			awful.tag.incmwfact( 0.05)
		end,
        {description = "increase master width factor", group = "layout"}),

    awful.key({ modkey,           }, ",",
		function ()
			awful.tag.incmwfact(-0.05)
		end,
        {description = "decrease master width factor", group = "layout"}),

	awful.key({ modkey}, "x",
		function()
			beautiful.master_width_factor = 0.5
		end ,
		{description="reset master_width_factor", group="awesome"}),

    awful.key({ modkey, "Shift"   }, ",",
		function ()
			awful.tag.incnmaster( 1, nil, true)
		end,
        {description = "add 1 master client", group = "layout"}),

    awful.key({ modkey, "Shift"   }, ".",
		function ()
			awful.tag.incnmaster(-1, nil, true)
		end,
        {description = "subtract 1 master client", group = "layout"}),

    awful.key({ modkey, "Control" }, ",",
		function ()
			awful.tag.incncol( 1, nil, true)
		end,
        {description = "increase the number of columns", group = "layout"}),

    awful.key({ modkey, "Control" }, ".",
		function ()
			awful.tag.incncol(-1, nil, true)
		end,
        {description = "decrease the number of columns", group = "layout"}),

    awful.key({ modkey,   }, "Next",
		function ()
			awful.layout.inc(-1)
		end,
		{description = "select next", group = "layout"}),

    awful.key({ modkey,   }, "Prior",
		function ()
			awful.layout.inc(1)
		end,
		{description = "select previous", group = "layout"}),
})

-- client bindings
client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
        awful.key({ modkey }, "F11",
            function (c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end,
            {description = "toggle fullscreen", group = "client"}),

        awful.key({ modkey }, "c",
			function (c)
					c:kill()
			end,
        	{description = "close", group = "client"}),

        awful.key({ modkey, "Control" }, "f",
			function(c)
				awful.client.floating.toggle()
				c:raise()
			end,
			{description = "toggle floating", group = "client"}),

        awful.key({ modkey }, "Home",
			function (c)
				c:swap(awful.client.getmaster())
			end,
            {description = "move to master", group = "client"}),

        awful.key({ modkey }, "o",
			function (c)
				c:move_to_screen()
			end,
            {description = "move to screen", group = "client"}),

        awful.key({ modkey }, "t",
			function (c)
				c.ontop = not c.ontop
			end,
            {description = "toggle keep on top", group = "client"}),

		awful.key({ modkey }, "u",
			awful.client.urgent.jumpto,
			{description = "jump to urgent client", group = "client"}),

    })
end)

-- Media bindings
client.connect_signal("request::default_keybindings", function()
	awful.keyboard.append_client_keybindings({
		awful.key({}, "XF86AudioLowerVolume",
			function ()
				awful.spawn("/usr/bin/pamixer -d 5", false)
			end),

		awful.key({}, "XF86AudioRaiseVolume",
			function ()
				awful.spawn("/usr/bin/pamixer -i 5", false)
			end),

		awful.key({}, "XF86AudioMute",
			function ()
				awful.spawn("pamixer -t", false)
			end),

		awful.key({modkey}, "Insert",
			function ()
				awful.spawn("/home/rob/bin/sinkctrl -c", false)
			end)
	})
end)

awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numrow",
        description = "only view tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    },
    awful.key {
        modifiers   = { modkey, "Control" },
        keygroup    = "numrow",
        description = "toggle tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    },
    awful.key {
        modifiers = { modkey, "Shift" },
        keygroup    = "numrow",
        description = "move focused client to tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers   = { modkey, "Control", "Shift" },
        keygroup    = "numrow",
        description = "toggle focused client on tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end,
    },
})

client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        awful.button({ }, 1, function (c)
            c:activate { context = "mouse_click" }
        end),
        awful.button({ modkey }, 1, function (c)
            c:activate { context = "mouse_click", action = "mouse_move"  }
        end),
        awful.button({ modkey }, 3, function (c)
            c:activate { context = "mouse_click", action = "mouse_resize"}
        end),
    })
end)

-- }}}
