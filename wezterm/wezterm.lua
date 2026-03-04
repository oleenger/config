local wezterm = require("wezterm")
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("MesloLGS Nerd Font Mono")

config.font_size = 17
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
	PATH = "/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin",
}

workspace_switcher.zoxide_path = "/opt/homebrew/bin/zoxide"

config.selection_word_boundary = " \t\n{[}]()\"'`,;:"

wezterm.on("toggle-opacity", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not overrides.window_background_opacity then
		overrides.window_background_opacity = 0.85
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
	{
		key = "p",
		mods = "CMD",
		action = workspace_switcher.switch_workspace(),
	},
	{ key = "Enter", mods = "SHIFT", action = wezterm.action({ SendString = "\n" }) },
}

return config
