local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.color_scheme = "Dracula (base16)"
config.font = wezterm.font("JetBrainsMonoNerdFont")
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.window_background_image = wezterm.home_dir .. "/Pictures/wallpaper.jpg"
config.window_background_image_hsb = {
	brightness = 0.1,
	hue = 1.0,
	saturation = 1.0,
}
config.window_background_opacity = 1.0
config.show_update_window = true

return config
