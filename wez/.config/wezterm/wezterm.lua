local wezterm = require 'wezterm'

local config = {

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

  -- Leave terminal open if exit with an error.
  exit_behavior = 'CloseOnCleanExit',
  clean_exit_codes = { 130 },

  window_close_confirmation = 'NeverPrompt',

  window_decorations = 'RESIZE',

  max_fps = 144;
  show_update_window = true,

  add_wsl_distributions_to_launch_menu = false,

  keys = {
    { key = 'w', mods = 'CTRL|SHIFT', action = wezterm.action.CloseCurrentPane { confirm = false } },
    { key = 't', mods = 'ALT', action = wezterm.action.ShowLauncher },
  }
}

local launch_menu = {}

-------------------------
-- CHECK OPERATING SYSTEM
-------------------------
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  -- We are running on Windows
  config.default_prog = {"wsl", "~"}

  table.insert(launch_menu, {
    label = 'PowerShell',
    args = { 'powershell.exe', '-NoLogo' },
  })

  -- Enumerate any WSL distributions that are installed and add those to the menu
  local success, wsl_list, wsl_err =
    wezterm.run_child_process { 'wsl.exe', '-l' }
  -- `wsl.exe -l` has a bug where it always outputs utf16:
  -- https://github.com/microsoft/WSL/issues/4607
  -- So we get to convert it
  wsl_list = wezterm.utf16_to_utf8(wsl_list)

  for idx, line in ipairs(wezterm.split_by_newlines(wsl_list)) do
    -- Skip the first line of output; it's just a header
    if idx > 1 then
      -- Remove the "(Default)" marker from the default line to arrive
      -- at the distribution name on its own
      local distro = line:gsub(' %(Default%)', '')

      -- Add an entry that will spawn into the distro with the default shell
      table.insert(launch_menu, {
        label = distro .. ' (WSL default shell)',
        args = { 'wsl', '~', '--distribution', distro },
      })
    end
  end

  table.insert(launch_menu, {
    label = 'DevCloud',
    args = { 'wsl', 'ssh', 'devcloud' },
  })

else
  config.default_prog = {}
end

config.launch_menu = launch_menu

return config
