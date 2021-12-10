local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

-- Plugins are installed here
return require('packer').startup(

  function(use)
    use 'wbthomason/packer.nvim'

    -- Lua Helpers
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'

    -- Color Schemes (using onedarker)
    use 'lunarvim/colorschemes'

    -- Nvim Tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        config = function() require'nvim-tree'.setup {} end
    }

    -- Built-in Neovim LSP
    -- use 'wespiard/nvim-lspconfig'
    use 'neovim/nvim-lspconfig'

    -- Completions
    -- use 'hrsh7th/nvim-cmp'

    -- Trouble (diagnostics, LSP error highlighting, etc.)
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

    -- Lualine (status bar at the bottom)
    use {
      'nvim-lualine/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- Treesitter (smart syntax highlighting)
    use {
      'nvim-treesitter/nvim-treesitter',
      --config = ':TSUpdate'
    }

    -- Telescope (GUI file search/fuzzy finder)
    use 'nvim-telescope/telescope.nvim'
    use {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = "make",
    }

    -- Which-Key pop-up menu with shortcuts
    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

    -- Autopairs didn't work first try, probably need to config
    -- use 'windwp/nvim-autopairs'
    
    -- LazyGit (TUI for Git, while Neovim is open)
    use 'kdheepak/lazygit.nvim'

    use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
      require('packer').sync()
    end
  end
)

