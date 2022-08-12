local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
    file_ignore_patterns = { ".git/", "node_modules/", "vendor/", "%.jpg", "%.jpeg", "%.JPG", "%.png", "%.PNG", "%.rar" }
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hiack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
}

telescope.load_extension("file_browser")

-- Find files by name
vim.keymap.set('n', '<leader>ff',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
end)

-- Grep files
vim.keymap.set('n', '<leader>fg', function()
  builtin.live_grep()
end)

-- Search in active buffers list
vim.keymap.set('n', '<leader>fb', function()
  builtin.buffers()
end)

-- Search in tags
vim.keymap.set('n', '<leader>ft', function()
  builtin.help_tags()
end)

-- Search in history (old files)
vim.keymap.set('n', '<leader>fh', function()
  -- builtin.resume()
  builtin.oldfiles()
end)

vim.keymap.set('n', ';;', function()
  builtin.resume()
end)

-- Search in diagnostics
vim.keymap.set('n', ';e', function()
  builtin.diagnostics()
end)

-- Telescope file browser
vim.keymap.set("n", "sf", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)