-- Bind options
local bind = vim.keymap.set

--Find files by name
bind('n', '<Leader>ff', ':Telescope find_files<CR>')

-- Grep files
bind('n', '<Leader>fg', ':Telescope live_grep<CR>')

-- Search in active buffers list
bind('n', '<Leader>fb', ':Telescope buffers<CR>')

-- Search in tags
bind('n', '<Leader>ft', ':Telescope help_tags<CR>')

-- Search in history (old files)
bind('n', '<Leader>fh', ':Telescope oldfiles<CR>')

require'telescope'.setup({
    defaults = {
        file_ignore_patterns = { "^./.git/", "node_modules/", "vendor/", "%.jpg", "%.jpeg", "%.JPG", "%.png", "%.PNG", "%.rar" }
    }
})

