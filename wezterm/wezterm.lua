local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

wezterm.on("toggle-opacity", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not overrides.window_background_opacity then
		overrides.window_background_opacity = 0.85
	else
		overrides.window_background_opacity = nil
	end
	window:set_config_overrides(overrides)
end)

default_domain = "WSL:Ubuntu-22.04"

return {

	enable_tab_bar = false,

	mouse_bindings = {
		{
			event = { Down = { streak = 1, button = "Right" } },
			mods = "NONE",
			action = wezterm.action_callback(function(window, pane)
				local has_selection = window:get_selection_text_for_pane(pane) ~= ""
				if has_selection then
					window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
					window:perform_action(act.ClearSelection, pane)
				else
					window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
				end
			end),
		},
	},

	color_scheme = "N0tch2k",
	window_background_opacity = 1,

	window_decorations = "RESIZE",

	font_size = 12,
	line_height = 1.2,

	use_dead_keys = false,
	scrollback_lines = 1000,

	keys = {
		{
			key = "1",
			mods = "CTRL",
			action = wezterm.action.ToggleFullScreen,
		},
		{
			key = "B",
			mods = "CTRL|SHIFT",
			action = wezterm.action.EmitEvent("toggle-opacity"),
		},
	},
}
