local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 28

config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 11

config.enable_tab_bar = false

config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

return config
