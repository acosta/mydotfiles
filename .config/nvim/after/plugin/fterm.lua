local status, fterm = pcall(require, "FTerm")
if (not status) then return end

fterm.setup({
  border = 'double',
  dimensions  = {
      height = 0.9,
      width = 0.9,
  },
})

-- keybindings
vim.keymap.set('n', '<C-i>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<C-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
