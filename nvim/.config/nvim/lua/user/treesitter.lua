local configs = require('nvim-treesitter.configs')

configs.setup {
  ensure_installed = 'maintained',

  sync_install = false,

  ignore_install = { '' }, -- List of parsers to ignore installing

  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { '' }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },


  -- Config for p00f/nvim-ts-rainbow
  rainbow = {
    enable = true,
    extended_mode = true,
    colors = {
      -- "#cc241d", -- don't want red
      "#a89984",
      "#b16286",
      "#d79921",
      "#689d6a",
      "#d65d0e",
      "#458588",
    },
    termcolors = {
      -- "Red",
      "Green",
      "Yellow",
      "Blue",
      "Magenta",
      "Cyan",
      "White",
    },
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },

  indent = { enable = true, disable = { 'yaml' } },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
