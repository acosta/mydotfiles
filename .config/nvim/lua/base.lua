local api = vim.api
local cmd = vim.cmd
local set = vim.opt

local indent = 2

set.encoding = 'utf-8'
set.fileencoding = 'utf-8'

set.termguicolors = true
set.background = 'dark'
set.cursorline = true

set.number = true
set.autoindent = true
set.smartindent = true
set.hlsearch = true
set.backup = false
set.swapfile = false
set.showcmd = true
set.cmdheight = 1
set.laststatus = 2
set.scrolloff = 10
set.shell = 'bash'
set.backupskip = { '/tmp/*', '/private/tmp/*' }
set.inccommand = 'split'
set.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
set.smartcase = true
set.smarttab = true
set.breakindent = true
set.splitbelow = true
set.splitright = true
set.shiftwidth = indent
set.tabstop = indent
set.softtabstop = indent
set.expandtab = true
set.fileformat = "unix"
set.modeline = false
set.wrap = false -- No Wrap lines
set.backspace = { 'start', 'eol', 'indent' }
set.path:append { '**' } -- Finding files - Search down into subfolders
set.wildignore = { '*/node_modules/*', '*/venv/*', '*/.venv/*', '.git' }
set.list = true
set.listchars = { tab='»·', trail='·', extends='…' }
set.clipboard:append { 'unnamedplus' }

-- Undercurl
cmd([[let &t_Cs = "\e[4:3m"]])
cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
set.formatoptions:append { 'r' }

-- Highlight whitespaces
cmd([[highlight WhitespaceEOL ctermbg=red ctermfg=white guibg=red guifg=white]])
cmd([[match WhitespaceEOL /\s\+$/]])

-- Trim whitespace onsave
cmd([[autocmd FileType c,cpp,java,php,html,javascript,css,python,sh,lua autocmd BufWritePre <buffer> %s/\s\+$//e]])

-- Setup highlight on yank
local lua_highlight = api.nvim_create_augroup("lua_highlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
  group = lua_highlight,
})
