-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use 'nvim-lua/plenary.nvim' -- Common utilities

  -- Git
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'lewis6991/gitsigns.nvim' -- Add git related info in the signs columns and popups

  -- Editor
  use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  use {
    'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
    config = function()
      require('Comment').setup()
    end
  }
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'nvim-treesitter/nvim-treesitter' -- Highlight, edit, and navigate code
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- Fuzzy Finder (files, lsp, etc)
  use 'nvim-telescope/telescope-file-browser.nvim'
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
  use 'windwp/nvim-autopairs'

  -- Code completion
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'neovim/nvim-lspconfig' -- LSP
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'williamboman/mason.nvim' -- Easily install and manage LSP servers, DAP servers, linters, and formatters
  use 'williamboman/mason-lspconfig.nvim'
  use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } } -- Snippet Engine and Snippet Expansion

  -- Color schemes
  use {
    disable = true,
    'Shatur/neovim-ayu',
    config = function()
      vim.cmd('colorscheme ayu-mirage')
    end
  }

  use {
    disable = false,
    'dracula/vim',
    config = function()
      vim.cmd('colorscheme dracula')
    end
  }

  use {
    disable = true,
    'tomasr/molokai',
    config = function()
      vim.cmd('colorscheme molokai')
    end
  }

  use {
    disable = true,
    'morhetz/gruvbox',
    config = function()
      vim.cmd('colorscheme gruvbox')
    end
  }

  if is_bootstrap then
    require('packer').sync()
  end

end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the plugins.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end
