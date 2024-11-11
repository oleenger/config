local wezterm = require 'wezterm'
local act = wezterm.action
local mux = wezterm.mux

local config = {}
if wezterm.config_builder then
				config = wezterm.config_builder()
end

wezterm.on('toggle-opacity', function(window, pane)
				local overrides = window:get_config_overrides() or {}
				if not overrides.window_background_opacity then
								overrides.window_background_opacity = 0.75
				else
								overrides.window_background_opacity = nil
				end
				window:set_config_overrides(overrides)
end)

default_domain = 'WSL:Ubuntu-22.04'

return {
colors = {
	foreground = "#CBE0F0",
	background = "#333333",
	cursor_bg = "#47FF9C",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
},
		send_composed_key_when_left_alt_is_pressed = true,
				enable_tab_bar = false,
				-- color_scheme = 'N0tch2k',
				-- color_scheme = 'Tomorrow Night (Gogh)',
				color_scheme = "Catppuccin Moc",
	font = wezterm.font("MesloLGS Nerd Font"),
font_size = 14,
				macos_window_background_blur = 10,
				window_decorations = "RESIZE",
				line_height = 1.2,
				scrollback_lines = 5000,
				window_close_confirmation = "NeverPrompt",
				-- adjust_window_size_when_changing_font_size = false,
				use_dead_keys = false,

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


				keys = {
								{
												key = '1',
												mods = 'CTRL',
												action = wezterm.action.ToggleFullScreen,
								},
								{
												key = 'B',
												mods = 'CTRL|SHIFT',
												action = wezterm.action.EmitEvent 'toggle-opacity',
								},
								{ key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
				},
}

