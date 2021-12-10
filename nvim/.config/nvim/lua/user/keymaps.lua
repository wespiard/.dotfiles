local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-Left>", "<C-w>h", opts) --left
keymap("n", "<C-Down>", "<C-w>j", opts) --down
keymap("n", "<C-Up>", "<C-w>k", opts) --up
keymap("n", "<C-Right>", "<C-w>l", opts) --right

-- Resize with arrows
keymap("n", "<C-k>", ":resize -2<CR>", opts)
keymap("n", "<C-j>", ":resize +2<CR>", opts)
keymap("n", "<C-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-l>", ":vertical resize +2<CR>", opts)

-- Naviagate buffers
keymap("n", "<S-Right>", ":bnext<CR>", opts)
keymap("n", "<S-Left>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-Up>", "<Esc>:m .-2<CR>", opts)
keymap("n", "<A-Down>", "<Esc>:m .+1<CR>", opts)

-- Insert --
-- Press jk fast to enter (not useful for colemak)
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-Up>", ":m .-2<CR>==", opts)
keymap("v", "<A-Down>", ":m .+1<CR>==", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "Up", ":move '<-2<CR>gv-gv", opts)
keymap("x", "Down", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-Up>", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-Down>", ":move '>+1<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Command --
-- Menu navigation
keymap("c", "<C-j>",  'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } )
keymap("c", "<C-k>",  'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } )

-- Git --
-- LazyGit
keymap("n", "<leader>gg", ":LazyGit<CR>", opts)
