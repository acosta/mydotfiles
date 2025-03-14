return {
  -- add dracula
  { "dracula/vim" },

  -- add everforest
  { "sainnhe/everforest",
    config = function ()
      vim.go.background = "light"
    end
  },

  -- add sonokai
  { "sainnhe/sonokai",
    config = function ()
      vim.go.sonokai_style = "andromeda"
    end,
  },

  -- Configure LazyVim to load the colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}
