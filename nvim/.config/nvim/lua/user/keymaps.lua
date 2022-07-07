-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Change VIM navigation keys to Colemak-DH
keymap({'n', 'v'}, 'm', 'h', opts)
keymap({'n', 'v'}, 'n', 'j', opts)
keymap({'n', 'v'}, 'e', 'k', opts)
keymap({'n', 'v'}, 'i', 'l', opts)
keymap({'n', 'v'}, 'h', 'i', opts)
keymap({'n', 'v'}, 'j', 'e', opts)
keymap({'n', 'v'}, 'k', 'm', opts)
keymap({'n', 'v'}, 'l', 'n', opts)
keymap({'n', 'v'}, 'M', 'H', opts)
keymap({'n', 'v'}, 'N', 'J', opts)
keymap({'n', 'v'}, 'E', 'K', opts)
keymap({'n', 'v'}, 'I', 'L', opts)
keymap({'n', 'v'}, 'H', 'I', opts)
keymap({'n', 'v'}, 'J', 'E', opts)
keymap({'n', 'v'}, 'K', 'M', opts)
keymap({'n', 'v'}, 'L', 'N', opts)

-- Normal --
-- Better window navigation
keymap("n", "<A-m>", "<C-w>h", opts)
keymap("n", "<A-n>", "<C-w>j", opts)
keymap("n", "<A-e>", "<C-w>k", opts)
keymap("n", "<A-i>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-i>", ":bnext<CR>", opts)
keymap("n", "<S-m>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
