local M = {}

local packer_bootstrap = false

local function packer_init()
  local fn = vim.fn
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    }
    vim.cmd [[packadd packer.nvim]]
  end
  vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
end

packer_init()

function M.setup()
  local conf = {
    compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  local function plugins(use)
    use { "lewis6991/impatient.nvim" }

    use { "wbthomason/packer.nvim" }

    -- Better syntax
    use {
      "nvim-treesitter/nvim-treesitter",
      as = "nvim-treesitter",
      event = "BufRead",
      opt = true,
      run = ":TSUpdate",
      -- config = function()
      --   require("config.treesitter").setup()
      -- end,
      requires = {
        { "jose-elias-alvarez/nvim-lsp-ts-utils" },
        { "JoosepAlviste/nvim-ts-context-commentstring" },
        { "p00f/nvim-ts-rainbow" },
        {
          "nvim-treesitter/playground",
          cmd = "TSHighlightCapturesUnderCursor",
        },
        {
          "nvim-treesitter/nvim-treesitter-textobjects",
        },
        { "RRethy/nvim-treesitter-textsubjects" },
        -- {
        --   "windwp/nvim-autopairs",
        --   run = "make",
        --   config = function()
        --     require("nvim-autopairs").setup {}
        --   end,
        -- },
        -- {
        --   "windwp/nvim-ts-autotag",
        --   config = function()
        --     require("nvim-ts-autotag").setup { enable = true }
        --   end,
        -- },
        -- {
        --   "romgrk/nvim-treesitter-context",
        --   config = function()
        --     require("treesitter-context.config").setup { enable = true }
        --   end,
        -- },
        -- {
        --   "mfussenegger/nvim-ts-hint-textobject",
        --   config = function()
        --     vim.cmd [[omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>]]
        --     vim.cmd [[vnoremap <silent> m :lua require('tsht').nodes()<CR>]]
        --   end,
        -- },
      },
    }


    -- LSP config
    use { "williamboman/nvim-lsp-installer" }
    use { "jose-elias-alvarez/null-ls.nvim" }
    use {
      "neovim/nvim-lspconfig",
      as = "nvim-lspconfig",
      after = "nvim-treesitter",
      opt = true,
      -- config = function()
      --   require("config.lsp").setup()
      --   require("config.dap").setup()
      -- end,
    }

    -- Completion - use either one of this
    use {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      opt = true,
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "quangnguyen30192/cmp-nvim-ultisnips",
        "hrsh7th/cmp-nvim-lua",
        "octaltree/cmp-look",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-calc",
        "f3fora/cmp-spell",
        "hrsh7th/cmp-emoji",
        "ray-x/cmp-treesitter",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp-document-symbol",
      },
      -- config = function()
      --   require("config.cmp").setup()
      -- end,
    }
    use {
      "tami5/lspsaga.nvim",
      -- config = function()
      --   require("config.lspsaga").setup()
      -- end,
    }
    use {
      "onsails/lspkind-nvim",
      config = function()
        require("lspkind").init()
      end,
    }
    use { "sbdchd/neoformat", event = "BufWinEnter" }
    use { "szw/vim-maximizer", event = "BufWinEnter" }
    use { "kshenoy/vim-signature", event = "BufWinEnter" }
    use { "kevinhwang91/nvim-bqf", event = "BufWinEnter" }
    use { "andymass/vim-matchup", event = "CursorMoved" }
    use { "ray-x/lsp_signature.nvim" }
    use {
      "folke/trouble.nvim",
      event = "VimEnter",
      cmd = { "TroubleToggle", "Trouble" },
      config = function()
        require("trouble").setup { auto_open = false }
      end,
    }
    use {
      "folke/todo-comments.nvim",
      cmd = { "TodoTrouble", "TodoTelescope" },
      config = function()
        require("todo-comments").setup {}
      end,
    }
    use {
      "nacro90/numb.nvim",
      event = "VimEnter",
      config = function()
        require("numb").setup()
      end,
    }
    use { "junegunn/vim-easy-align", event = "BufReadPost" }
    use { "antoinemadec/FixCursorHold.nvim", event = "BufReadPost" }

    if packer_bootstrap then
      print "Setting up Neovim. Restart required after installation!"
      require("packer").sync()
    end

  end

  pcall(require, "impatient")
  pcall(require, "packer_compiled")
  require("packer").init(conf)
  require("packer").startup(plugins)
end

return M
