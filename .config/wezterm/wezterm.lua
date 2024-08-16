-- import the wezterm module
local wezterm = require("wezterm")

-- Create a config object
local config = wezterm.config_builder()

-- Remove title bar
config.window_decorations = "RESIZE"

-- colorscheme
config.color_scheme = "Desert"

--config.font = wezterm.font("FiraCode Nerd Font", { weight = "Medium" })
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium" })

config.font_size = 11

return config
