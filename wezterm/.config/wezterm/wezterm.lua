local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

config.font = wezterm.font("Lilex Nerd Font Mono")

-- config.color_scheme = "Gruvbox Dark Hard"
-- config.color_scheme = "Obsidian"
-- config.color_scheme = "Tokyo Night"
-- config.color_scheme = "Omni (Gogh)"
-- config.color_scheme = "Orangish (terminal.sexy)"

return config
