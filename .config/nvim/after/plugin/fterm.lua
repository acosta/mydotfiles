local status, fterm = pcall(require, "FTerm")
if (not status) then return end

fterm.setup({
  border = 'double',
  dimensions  = {
    height = 0.9,
    width = 0.9,
  },
})

-- creating new vim commands
vim.api.nvim_create_user_command('FTermOpen', require('FTerm').open, { bang = true })
vim.api.nvim_create_user_command('FTermClose', require('FTerm').close, { bang = true })
vim.api.nvim_create_user_command('FTermExit', require('FTerm').exit, { bang = true })
vim.api.nvim_create_user_command('FTermToggle', require('FTerm').toggle, { bang = true })

-- keybindings
vim.keymap.set('n', '<leader>tt', ':FTermToggle <CR>', { noremap = true })
vim.keymap.set('t', '<leader>tt', '<C-\\><C-n><:FTermToggle <CR>', { noremap = true })
