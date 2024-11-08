local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font 'JetBrains Mono'
config.color_scheme = 'Catppuccin Mocha'

config.font_size = 18

config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
    left=0,
    right=0,
    top=0,
    bottom=0,
}

return config
