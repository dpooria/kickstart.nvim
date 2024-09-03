--OPTIONS
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
-- undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
-- highlight search
-- vim.opt.hlsearch = false
vim.opt.incsearch = true
--
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append '@-@'
vim.opt.updatetime = 50
vim.opt.colorcolumn = '128'
--for better visual-block behaviour according to ChatGPT
--It is not
-- vim.o.virtualedit = 'all'

--KEYMAPS
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true, silent = true })
-- ThePrimeagen keymaps
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
-- Highlight move
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- greatest remap ever
vim.keymap.set('x', '<leader>p', [["_dP]])
-- next greatest remap ever : asbjornHaland
-- Yank into systems clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])
vim.keymap.set({ 'n', 'v' }, '<leader>c', [["_c]])
vim.keymap.set({ 'n', 'v' }, 'x', [["_x]])

-- This is going to get me cancelled
vim.keymap.set('i', '<C-c>', '<Esc>')

vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--SPLIT WINDOW
vim.keymap.set('n', '<leader>vsp', '<cmd>vsplit<CR>')
vim.keymap.set('n', '<leader>hsp', '<cmd>split<CR>')
vim.keymap.set('n', '<leader>x', '<cmd>q<CR>')
vim.keymap.set('n', '<leader>ll', '<cmd>w<CR>')
-- Execute macro on multiple lines
vim.keymap.set('v', '<leader>q', '<cmd>normal @q<CR>')
-- vim.keymap.set("n", ".", "")
-- isort
vim.keymap.set('n', '<leader>is', '<cmd>Isort<CR>')
-- toggle TSContext
vim.keymap.set('n', '<leader>ts', '<cmd>TSContextToggle<CR>')
--copilot
vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")', { expr = true, silent = true })
-- diable dot
vim.api.nvim_set_keymap('n', '.', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<localleader>n', '<cmd>bnext<CR>', { noremap = true, silent = true })
local mark = require 'harpoon.mark'
local ui = require 'harpoon.ui'
vim.keymap.set('n', '<leader>ha', mark.add_file)
vim.keymap.set('n', '<leader>hr', mark.rm_file)
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)
-- repeat indention with > and < in visual mode
-- -- Initialize a variable to store the last operation
-- vim.g.last_op = ''
-- -- Map > for indenting and store the operation
-- vim.api.nvim_set_keymap('v', '>', '>gv:lua vim.g.last_op = ">"<CR>', { noremap = true, silent = true })
-- -- Map < for unindenting and store the operation
-- vim.api.nvim_set_keymap('v', '<', '<gv:lua vim.g.last_op = "<"<CR>', { noremap = true, silent = true })
-- -- Map a key (for example ,.) to repeat the last operation
-- vim.api.nvim_set_keymap('n', ',.', ':lua vim.cmd("normal! " .. vim.g.last_op)<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')
return {}
