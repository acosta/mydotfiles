local ts = require('nvim-treesitter.configs')

ts.setup({
  highlight = {
    enable = true,
    use_languagetree = true
  },
  ensure_installed = {
    'bash',
    'c',
    'cmake',
    'cpp',
    'css',
    'cuda',
    'dockerfile',
    'dot',
    'elixir',
    'html',
    'javascript',
    'json',
    'julia',
    'kotlin',
    'lua',
    'markdown',
    'python',
    'rust',
    'tsx',
    'typescript',
    'vim',
    'yaml'
  },
})
