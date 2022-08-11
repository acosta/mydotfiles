local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Tabs
-- "New tab: Ctrl + t
keymap.set('n', '<C-t>', ':tabnew<CR>')
keymap.set('i', '<C-t>',  '<Esc>:tabnew<CR>')
-- "Close tab: Ctrl + c
keymap.set('n', '<C-c>', ':tabclose<CR>')
keymap.set('i', '<C-c>',  '<Esc>:tabclose<CR>')
-- "Go to next tab: Ctrl + .
keymap.set('n', '<C-.>', 'gt')
-- "Go to previous tab: Ctrl + ,
keymap.set('n', '<C-,>', 'gT')

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Move window
keymap.set('n', '<Space>', '<C-w>w')

-- \n to turn off search highlighting
keymap.set('n', '<leader>n', ':silent :nohlsearch<CR>')

-- \l to toggle visible whitespace
keymap.set('n', '<leader>l', ':set list!<CR>')

-- Moving lines using Ctrl+j (down) or Ctrl+k (up)
-- The mappings work in normal, insert and visual modes
keymap.set('n', '<C-j>', ':m .+1<CR>==')
keymap.set('n', '<C-k>', ':m .-2<CR>==')
keymap.set('i', '<C-j>', '<Esc>:m .+1<CR>==gi')
keymap.set('i', '<C-k>', '<Esc>:m .-2<CR>==gi')
keymap.set('v', '<C-j>', ':m \'>+1<CR>gv=gv')
keymap.set('v', '<C-k>', ':m \'<-2<CR>gv=gv')
