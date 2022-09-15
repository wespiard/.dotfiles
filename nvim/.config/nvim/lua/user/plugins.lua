local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- -- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--   augroup end
-- ]])

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  -- log = { level = 'debug' },
}

-- Install your plugins here
return packer.startup(function(use)
  use { 'wbthomason/packer.nvim' } -- Have packer manage itself
   use { 'nvim-lua/plenary.nvim' } -- Useful lua functions used by lots of plugins

  -- My plugins here

  -- Colorschemes
   use 'folke/tokyonight.nvim'
   use 'edeneast/nightfox.nvim'

  -- Comments
   use 'numtostr/comment.nvim'

  -- Interface
  -- use { 'akinsho/bufferline.nvim' }
  -- use { 'nvim-lualine/lualine.nvim' }
  use { 'akinsho/bufferline.nvim', requires = { 'kyazdani142/nvim-web-devicons' } }
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons'} }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', tag = '*', requires = {'nvim-lua/plenary.nvim'}}
  use { 'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    use { 'nvim-telescope/telescope-project.nvim' }
  }

  -- File Explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter',
   run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
   requires = {'nvim-treesitter/nvim-treesitter-textobjects'}
  }

  use "lukas-reineke/indent-blankline.nvim"
  use { 'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end }

  -- LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end

end)

