return {
  -- add dracula
  { "dracula/vim" },

  -- add everforest
  { "sainnhe/everforest" },

  -- Configure LazyVim to load the colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}
