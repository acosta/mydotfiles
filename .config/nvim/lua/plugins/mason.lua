return {
  -- add server protocols and formatters
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP
        "clangd",
        "cmake-language-server",
        "lua-language-server",
        "pyright",
        -- formatters
        "black",
        "clang-format",
        "isort",
        "prettier",
        "stylua",
        "shfmt",
        -- linters
        "editorconfig-checker",
        "eslint_d",
        "ruff",
      },
    },
  },
}
