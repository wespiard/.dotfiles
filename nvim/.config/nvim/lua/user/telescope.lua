local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

pcall(telescope.load_extension('project'))
pcall(telescope.load_extension('fzf'))

telescope.setup {
  defaults = {
    
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },

    mappings = {
      i = {
        ["<C-n>"] = actions.move_selection_next,
        ["<C-e>"] = actions.move_selection_previous,
      },
    },
  },

  pickers = {
    find_files = {
      hidden = true,
    },
  },

  extensions = {
    project = {
      base_dirs = {},
      hidden_files = true,
    }
  }
}

