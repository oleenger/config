local wezterm = require 'wezterm'
-- local act = wezterm.action
-- local mux = wezterm.mux

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font("MesloLGS NF")
config.font_size = 15
config.line_height = 1.1
config.enable_tab_bar = false

config.color_scheme = 'Gruvbox Material (Gogh)'
config.colors = {}
config.colors.background = '#222222'

config.scrollback_lines = 5000
config.window_close_confirmation = "NeverPrompt"
config.use_dead_keys = false

config.window_decorations = "RESIZE"
config.send_composed_key_when_left_alt_is_pressed = true

config.window_padding = {
	left = 20,
	right = 20,
	top = 20,
	bottom = 10,
}

wezterm.on('toggle-opacity', function(window, pane)
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
		key = 'B',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.EmitEvent 'toggle-opacity',
	},
}

return config
