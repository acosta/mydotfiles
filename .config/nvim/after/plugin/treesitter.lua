local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    use_languagetree = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
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
    'markdown_inline',
    'python',
    'rust',
    'tsx',
    'typescript',
    'vim',
    'yaml'
  },
  autotag = {
    enable = true,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
