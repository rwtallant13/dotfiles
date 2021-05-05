local awful = require("awful")

awful.screen.connect_for_each_screen(function(s)

	layouts = awful.layout.layouts
	tags = {
	  settings = {
		{ names  = { "1", "2", "3", "4", "5", "6", "7", "8", "9" },
		  layout = { layouts[1], layouts[1], layouts[1], layouts[1] }
		},
		{ names  = { "1", "2", "3", "4", "5", "6", "7", "8", "9"},
		  layout = { layouts[1], layouts[1], layouts[1], layouts[1] }
	}}}

	tags[s] = awful.tag(tags.settings[s.index].names, s, tags.settings[s.index].layout)
end)
