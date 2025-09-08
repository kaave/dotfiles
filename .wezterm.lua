local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- global
config.hide_mouse_cursor_when_typing = true
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"

-- style
config.initial_cols = 120
config.initial_rows = 40
config.window_padding = {
	left = 8,
	right = 8,
	top = 0,
	bottom = 4,
}
config.color_scheme = "Solarized (dark) (terminal.sexy)"

-- font
config.font_size = 18
config.font = wezterm.font("UDEV Gothic 35NF")
config.line_height = 1.2

return config
