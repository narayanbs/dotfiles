-- import the wezterm module
local wezterm = require("wezterm")

-- Create a config object
local config = wezterm.config_builder()

-- Remove title bar
config.window_decorations = "RESIZE"

-- colorscheme
config.color_scheme = "Desert"

-- font
--config.font = wezterm.font("FiraCode Nerd Font", { weight = "Medium" })
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium" })
config.font_size = 11

-- Config keys
--
-- timeout_milliseconds defaults to 1000 and can be omitted
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {

	-- Split Pane Horizontally (CTRL-a SHIFT |)
	{
		key = "|",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	-- Split Pane Vertically (CTRL-a SHIFT %)
	{
		key = "%",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	-- Create command window by splitting pane Vertically
	{
		key = "_",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitPane({ direction = "Down", size = { Percent = 30 } }),
	},

	-- Navigation ()
	{
		-- VIM direction keybindings (Default is CTRL|SHIFT up and down which i prefer)
		key = "j", -- or DownArrow
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k", -- or UpArrow
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "h", -- or LeftArrow
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l", -- or RightArrow
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},

	-- Resizing panes
	{
		key = "h",
		mods = "LEADER|CTRL",
		-- "3" here is the amount of cells we wish to resize
		-- the terminal by
		action = wezterm.action.AdjustPaneSize({ "Left", 3 }),
	},
	{
		key = "l",
		mods = "LEADER|CTRL",
		-- "3" here is the amount of cells we wish to resize
		-- the terminal by
		action = wezterm.action.AdjustPaneSize({ "Right", 3 }),
	},
	{
		key = "k",
		mods = "LEADER|CTRL",
		-- "3" here is the amount of cells we wish to resize
		-- the terminal by
		action = wezterm.action.AdjustPaneSize({ "Up", 3 }),
	},
	{
		key = "j",
		mods = "LEADER|CTRL",
		-- "3" here is the amount of cells we wish to resize
		-- the terminal by
		action = wezterm.action.AdjustPaneSize({ "Down", 3 }),
	},
}

return config
