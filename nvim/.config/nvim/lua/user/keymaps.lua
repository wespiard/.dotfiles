local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-Left>", "<C-w>h", opts) -- Left
keymap("n", "<C-Down>", "<C-w>j", opts) -- Down
keymap("n", "<C-Up>", "<C-w>k", opts) -- Up
keymap("n", "<C-Right>", "<C-w>l", opts) -- Right

-- Resize windows
keymap("n", "<C-k>", ":resize -2<CR>", opts)
keymap("n", "<C-j>", ":resize +2<CR>", opts)
keymap("n", "<C-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-l>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-Right>", ":bnext<CR>", opts)
keymap("n", "<S-Left>",  ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-Up>",   "<Esc>:m .-2<CR>", opts)
keymap("n", "<A-Down>", "<Esc>:m .+1<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-Down>", ":m .+1<CR>==", opts)
keymap("v", "<A-Up>",   ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "Down", ":move '>+1<CR>gv-gv", opts)
keymap("x", "Up",   ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-Down>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-Up>",   ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-Left>",  "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-Down>",  "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-Up>",    "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-Right>", "<C-\\><C-N><C-w>l", term_opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)