local wezterm = require 'wezterm'

local config = {}

-------------------------
-- CHECK OPERATING SYSTEM
-------------------------
default_prog = {}
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  -- We are running on Windows
  default_prog = {"wsl", "~"}
else
  default_prog = {}
end


config = {

  default_prog = default_prog,

  -------------------------
  -- FONTS
  -------------------------
  
  font_size = 13.0;
  font = wezterm.font_with_fallback {
    { family = 'Fira Code',
      harfbuzz_features = {
        "zero", "cv04", "cv02", "ss05", "ss04", "ss03", 
        "cv31", "cv31", "cv29", "cv30", "cv20", "cv24"
      }
    },
    { family = 'JetBrains Mono' },
  },

  -------------------------
  -- COLOR SCHEMES
  -------------------------
  -- color_scheme = "Afterglow",
  -- color_scheme = "Blazer",
  -- color_scheme = "Dracula+",
  -- color_scheme = "Espresso",
  -- color_scheme = "Gruvbox Dark",
  -- color_scheme = "Hopscotch.256",
  -- color_scheme = "jubi",
  -- color_scheme = "Later This Evening",
  -- color_scheme = "lovelace",
  -- color_scheme = "MaterialDarker",
  color_scheme = "nord",
  -- color_scheme = "OneHalfDark",
  -- color_scheme = "Subliminal",

  -- Change font size without aftecting window
  adjust_window_size_when_changing_font_size = false,

  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,

  -- Close window without prompt
  window_close_confirmation = "NeverPrompt",
}


return config
