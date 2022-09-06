local wezterm = require 'wezterm';

local config = {

  -------------------------
  -- FONTS
  -------------------------
  
  font_size = 13.0;
  font = wezterm.font({
    family="Fira Code",
    harfbuzz_features = {"zero", "cv04", "cv02", "ss05", "ss04", "ss03", "cv31", "cv31", "cv29", "cv30", "cv20", "cv24"}
  }),
   

  -- You can specify some parameters to influence the font selection;
  -- for example, this selects a Bold, Italic font variant.
  -- font = wezterm.font("JetBrains Mono", {weight="Bold", italic=true})


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
  -- window_close_confirmation = "NeverPrompt",
}

local current_os = os.execute(uname);

-------------------------
-- DEFAULT PROGRAM
-------------------------
-- Launch WSL by default, starting in user home directory.
if (current_os == true) 
then
  -- print('Running on Linux!');
else
  -- print('Running on something besides linux!');
  config.default_prog = {"wsl", "~"};
end

return config;

