local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

if wezterm.config_builder then
        config = wezterm.config_builder()
end

-- ui
-- config.color_scheme = "Monokai"
config.color_scheme = "tokyonight_night"
config.font = wezterm.font("JetBrains Mono")
config.font_size = 16.0
config.text_background_opacity = 0.3

-- basic
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
-- lines to retain per tab
config.scrollback_lines = 1000

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 2000 }

-- key binding
config.keys = {
        {
                key = "|",
                mods = "CMD",
                action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
        },
        {
                key = "-",
                mods = "CMD",
                action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
        },
        {
                key = "n",
                mods = "CMD",
                action = act.ToggleFullScreen,
        },
        {
                key = "k",
                mods = "CMD",
                action = act.ClearScrollback("ScrollbackAndViewport"),
        },
        {
                key = "l",
                mods = "CMD",
                action = act.ShowTabNavigator,
        },
        {
                key = "w",
                mods = "CMD",
                action = act.CloseCurrentTab({ confirm = true }),
        },
        {
                key = ",",
                mods = "LEADER",
                action = act.PromptInputLine({
                        description = "Enter new name for current tab",
                        action = wezterm.action_callback(function(window, pane, line)
                                if line then
                                        window:active_tab():set_title(line)
                                end
                        end),
                }),
        },
        { key = "p", mods = "CMD", action = act.PaneSelect },
}

return config
