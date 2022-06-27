local fn = vim.fn

-- Automatically install Packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify('Failed to require Packer.', vim.log.levels.ERROR)
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


return packer.startup(
  function(use)

    use 'wbthomason/packer.nvim' -- Have packer manage itself
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    -- Color Schemes
    use 'LunarVim/darkplus.nvim'
    use 'LunarVim/onedarker.nvim'
    use 'folke/tokyonight.nvim'

    -- Comments
    use 'numToStr/Comment.nvim'

    -- Text completions
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'

    -- Snippets
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- Nvim Tree
    use { 'kyazdani42/nvim-tree.lua',
      requires = {'kyazdani42/nvim-web-devicons'},
      tag = 'nightly'
    }

    -- Bufferline
    use {'akinsho/bufferline.nvim',
      requires = {'kyazdani42/nvim-web-devicons'},
      tag = "v2.*"
    }
    use 'moll/vim-bbye'

    -- LuaLine
    use 'nvim-lualine/lualine.nvim'

    -- Telescope
    use 'nvim-telescope/telescope.nvim'
    use 'ahmedkhalf/project.nvim'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

      -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'}
    use 'nvim-treesitter/playground'
    use {'p00f/nvim-ts-rainbow'}
          -- 'JoosepAlviste/nvim-ts-context-commentstring',
          -- requires = {'nvim-treesitter/nvim-treesitter'}}

    -- Toggleterm
    use 'akinsho/toggleterm.nvim'

    -- Autopairs
    use 'windwp/nvim-autopairs'

    -- Git
    use { 'lewis6991/gitsigns.nvim',
      requires = {'nvim-lua/plenary.nvim'}}

    -- Whichkey
    use 'folke/which-key.nvim'

    -- Automatically set up your configuration after cloning
    -- packer.nvim put this at the end after all plugins
    if PACKER_BOOTSTRAP then
      packer.sync()
    end

  end
)
