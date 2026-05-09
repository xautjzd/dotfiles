local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Batman"
-- config.font = wezterm.font("JetBrains Mono")
config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
	"Heiti SC",
	"Songti SC",
})
config.font_size = 16.0

config.tab_bar_at_bottom = true

config.check_for_updates = false
config.show_update_window = false

config.keys = {
	{
		key = "|",
		mods = "CMD",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "CMD",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "n",
		mods = "CMD",
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = "l",
		mods = "CMD",
		action = wezterm.action.ShowTabNavigator,
	},
	{
		key = "r",
		mods = "CMD",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}

return config
