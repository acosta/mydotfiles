return {
  -- add server protocols and formatters
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "cmake",
        "lua_ls",
        "pyright",
        "black",
        "clang-format",
        "isort",
        "prettier",
        "stylua",
        "shfmt",
      },
    },
  },
}
