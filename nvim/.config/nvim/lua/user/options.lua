-- Set leader to "space"
vim.g.mapleader = ' '

local options = {
  backup = false,               -- creates a backup file
  clipboard = "unnamedplus",    -- allows nvim access to system clipboard
  expandtab = true,             -- convert tabs to spaces
  shiftwidth = 2,               -- the number of spaces inserted for each indentation
  tabstop = 2,                  -- insert 2 spaces for a tab
  cursorline = true,            -- highlight the current line
  number = true,                -- set numbered lines
  relativenumber = true,        -- set relative numbered lines
  numberwidth = 2,              -- set number column width to 2 {default 4}
  signcolumn = "yes",           -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                 -- display lines as one long line
  scrolloff = 8,                -- padding when scrolling with cursor
  showtabline = 2,              -- always show tabs
  colorcolumn = '80',             --
  sidescrolloff = 8,
  smartindent = true,
  splitbelow = true,            -- force split direction
  splitright = true,
  swapfile = false,             -- creates a swapfile
  timeoutlen = 100,             -- time to wait for mapped sequence to complete (in milliseconds)
  undofile = true,              -- enable persistent undo
  updatetime = 300,             -- faster completion (4000ms default)
  writebackup = false,          -- prevent editing a file modified elsewhere
  guifont = "monospace:h17",    -- the font used in graphical neovim applications
}

vim.opt.shortmess:append "c"

-- Iterate through above configs and apply them
for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Allow more actions (like arrow keys) to go to next line
vim.cmd "set whichwrap+=<,>,[,],h,l"

-- Set colorscheme
vim.cmd "colorscheme onedarker"

-- Set lualine configuration
require('lualine').setup()

