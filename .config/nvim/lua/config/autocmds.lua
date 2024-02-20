-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local api = vim.api

-- Setup toggle between relative and nonrelative line numbers
-- local numbertogglegroup = api.nvim_create_augroup("numbertoggle", {})
-- local rn_patterns = { "*.c", "*.cpp", "*.h", "*.py", "*.html", "*.ts", "*.css", "*.tsx", "*.js", "*.json", "*.lua" }
-- api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave" }, {
--   pattern = rn_patterns,
--   callback = function()
--     vim.wo.relativenumber = true
--   end,
--   group = numbertogglegroup,
-- })
-- api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter" }, {
--   pattern = rn_patterns,
--   callback = function()
--     vim.wo.relativenumber = false
--   end,
--   group = numbertogglegroup,
-- })

-- Trim whitespace onsave
api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
