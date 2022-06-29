-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

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


-- PLUGINS --

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)


