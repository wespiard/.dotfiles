local wezterm = require("wezterm")

local config = {

	-- default_domain = "WSL:Arch",

	-------------------------
	-- FONTS
	-------------------------
	font_size = 12.0,
	font = wezterm.font_with_fallback({
		{ family = "ComicCode Nerd Font", harfbuzz_features = { "ss04" } },
		{
			family = "Fira Code",
			harfbuzz_features = {
				"zero",
				"cv04",
				"cv02",
				"ss05",
				"ss04",
				"ss03",
				"cv31",
				"cv31",
				"cv29",
				"cv30",
				"cv20",
				"cv24",
			},
		},
		{ family = "JetBrains Mono" },
	}),

	-------------------------
	-- COLOR SCHEMES
	-------------------------
	-- color_scheme = "Afterglow",
	-- color_scheme = "Ashes (base16)",
	-- color_scheme = "Ashes (light) (terminal.sexy)",
	-- color_scheme = "dawnfox",
	-- color_scheme = "Blazer",
	-- color_scheme = "Dracula+",
	-- color_scheme = "Espresso",
	-- color_scheme = "Gruvbox Dark",
	-- color_scheme = "Hopscotch.256",
	color_scheme = "jubi",
	-- color_scheme = "Later This Evening",
	-- color_scheme = "lovelace",
	-- color_scheme = "MaterialDarker",
	-- color_scheme = "nord",
	-- color_scheme = "OneHalfDark",
	-- color_scheme = "Subliminal",

	-- Change font size without affecting window
	adjust_window_size_when_changing_font_size = false,

	tab_bar_at_bottom = true,
	hide_tab_bar_if_only_one_tab = false,

	audible_bell = "Disabled",

	-- Leave terminal open if exit with an error.
	exit_behavior = "CloseOnCleanExit",
	clean_exit_codes = { 130 },
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",

	max_fps = 144,
	show_update_window = true,

	keys = {
		{ key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
		{ key = "t", mods = "ALT", action = wezterm.action.ShowLauncher },
	},
}

return config
