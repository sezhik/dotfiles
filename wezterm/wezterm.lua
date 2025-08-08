-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.hide_tab_bar_if_only_one_tab = true
config.color_scheme = "Catppuccin Macchiato"
config.window_padding = {
	left = 5,
	right = 5,
	top = 10,
	bottom = 0,
}

config.window_decorations = "RESIZE"
-- config.font = wezterm.font_with_fallback({
-- 	"JetBrainsMono Nerd Font",
-- 	"Hack Nerd Font",
-- 	"FiraCode Nerd Font",
-- })
config.font = wezterm.font("JetBrainsMono Nerd Font", {
	weight = "Medium",
})
config.font_size = 16

-- Finally, return the configuration to wezterm:
return config
