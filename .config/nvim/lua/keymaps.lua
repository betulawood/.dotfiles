local builtin = require('telescope.builtin')

-- Shorten function name
local keymap = vim.keymap.set



vim.g.mapleader = " "

-- Save with `<leader>w`
keymap('n', '<leader>w', ':w<CR>')

-- Quit with `<leader>q`
keymap('n', '<leader>q', ':q<CR>')

-- Split navigation
keymap('n', '<C-h>', '<C-w>h')
keymap('n', '<C-j>', '<C-w>j')
keymap('n', '<C-k>', '<C-w>k')
keymap('n', '<C-l>', '<C-w>l')

-- Quickly open netrw with `<leader>e`
keymap('n', '<leader>e', ':Ex<CR>')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })

vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

