local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("MesloLGS NF")

config.font_size = 15
config.line_height = 1.1
config.enable_tab_bar = false

config.color_scheme = "Gruvbox Material (Gogh)"
config.colors = {}
config.colors.foreground = "#e2dfd2"

config.font_shaper = "Harfbuzz"
config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }

config.scrollback_lines = 5000
config.window_close_confirmation = "NeverPrompt"
config.use_dead_keys = false

config.window_decorations = "RESIZE"
config.send_composed_key_when_left_alt_is_pressed = true
config.max_fps = 120

config.window_padding = {
	left = 20,
	right = 20,
	top = 20,
	bottom = 10,
}

config.set_environment_variables = {
	ENABLE_TMUX_STARTUP = "true",
}
config.selection_word_boundary = " \t\n{[}]()\"'`,;:"

wezterm.on("toggle-opacity", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not overrides.window_background_opacity then
		overrides.window_background_opacity = 0.75
		overrides.macos_window_background_blur = 10
	else
		overrides.window_background_opacity = nil
		overrides.macos_window_background_blur = nil
	end
	window:set_config_overrides(overrides)
end)

config.keys = {
	{
		key = "B",
		mods = "CTRL|SHIFT",
		action = wezterm.action.EmitEvent("toggle-opacity"),
	},
	{ key = "Enter", mods = "SHIFT", action = wezterm.action({ SendString = "\n" }) },
}

return config
