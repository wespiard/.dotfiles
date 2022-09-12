local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then return end

configs.setup({
	ensure_installed = {
    'bash', 'bibtex', 'c', 'cmake', 'cpp', 'html', 'json',
    'julia', 'latex', 'lua', 'make', 'markdown', 'python',
    'rust', 'toml', 'verilog', 'vim', 'yaml'
  },
	highlight = { enable = true },
	indent = { enable = true },
	autopairs = { enable = true },
})


-- Add `core` filetype for FuseSoC.
vim.filetype.add({
  extension = {
    core = 'core'
  }
})

-- Configure treesitter to use a YAML parser for `core` files.
local ft_to_parser = require"nvim-treesitter.parsers".filetype_to_parsername
ft_to_parser.core = "yaml"
