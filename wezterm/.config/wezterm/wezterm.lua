local wezterm = require("wezterm")
local mux = wezterm.mux

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():toggle_fullscreen()
end)
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.color_scheme = "Black Metal (Venom) (base16)"
config.font = wezterm.font("MesloLGLDZ Nerd Font Propo")
config.font_rules = {
	{
		italic = false,
		intensity = "Normal",
		font = wezterm.font("MesloLGLDZ Nerd Font Propo", { weight = "Regular" }),
	},
	{
		intensity = "Bold",
		font = wezterm.font("MesloLGLDZ Nerd Font Propo", { weight = "Bold" }),
	},
	{
		italic = true,
		font = wezterm.font("MesloLGLDZ Nerd Font Propo", { italic = true }),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font("MesloLGLDZ Nerd Font Propo", { weight = "Bold", italic = true }),
	},
}
config.font_size = 11.5
config.cell_width = 1.0
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.window_background_image = wezterm.home_dir .. "/Pictures/wallpaper.png"
config.window_background_image_hsb = {
	brightness = 0.05,
	hue = 1.0,
	saturation = 1.0,
}
config.window_background_opacity = 1.0
config.show_update_window = true

return config
