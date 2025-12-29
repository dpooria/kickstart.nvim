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
-- vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>pv', '<cmd>Oil<CR>')
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
-- vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
-- vim.keymap.set('n', '<leader>Y', [["+Y]])

vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])
vim.keymap.set({ 'n', 'v' }, '<leader>c', [["_c]])
vim.keymap.set({ 'n', 'v' }, 'x', [["_x]])

vim.keymap.set('i', '<C-c>', '<Esc>')
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
-- isort
vim.keymap.set('n', '<leader>is', '<cmd>Isort<CR>')
-- toggle TSContext
vim.keymap.set('n', '<leader>ts', '<cmd>TSContextToggle<CR>')
--copilot
vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")', { expr = true, silent = true })
-- diable dot
-- vim.api.nvim_set_keymap('n', '.', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 's', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<localleader>n', '<cmd>bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<localleader>p', '<cmd>bprev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<localleader>x', '<cmd>bd<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<localleader>l', '<cmd>ls<CR>', { noremap = true, silent = true })
local mark = require 'harpoon.mark'
local ui = require 'harpoon.ui'
vim.keymap.set('n', '<leader>ha', mark.add_file)
vim.keymap.set('n', '<leader>hr', mark.rm_file)
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)
-- repeat indention with > and < in visual mode
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')
-- cursor
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
-- search on google
-- Function to search Google with the visually selected text
local function get_visual_selection()
    local s_start = vim.fn.getpos "'<"
    local s_end = vim.fn.getpos "'>"
    local n_lines = math.abs(s_end[2] - s_start[2]) + 1
    local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
    lines[1] = string.sub(lines[1], s_start[3], -1)
    if n_lines == 1 then
        lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
    else
        lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
    end
    return table.concat(lines, '\n')
end

function SEARCH_ON_GOOGLE()
    local query = get_visual_selection():gsub('#', '%%23')
    local url = 'https://www.google.com/search?q=' .. vim.fn.escape(query, ' ')
    vim.fn.jobstart({ 'qutebrowser', url }, { detach = true })
end

vim.keymap.set('v', '<leader>sg', ':<C-u>lua SEARCH_ON_GOOGLE()<CR>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = { '*.vert', '*.frag', '*.geom', '*.glsl' },
    command = 'set filetype=glsl',
})
-- terminal
vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_namespace 'custom-term-open',
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})
local term_buf = 0
vim.keymap.set('n', '<leader>ot', function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd 'J'
    vim.api.nvim_win_set_height(0, 5)
    term_buf = vim.bo.channel
end)
vim.keymap.set('n', '<leader>list', function()
    vim.fn.chansend(term_buf, { 'ls\r\n' })
end)
-- set keybind for exiting terminal mode
vim.keymap.set('t', '<C-[>', '<C-\\><C-n>')

vim.keymap.set("n", "<localleader>r", function()
    local oil = require("oil")
    local entry = oil.get_cursor_entry()
    if entry and entry.type == "file" then
        -- Get the base directory from oil.nvim
        local base_dir = oil.get_current_dir() or vim.fn.getcwd()                -- Fallback to CWD
        local filepath = vim.fn.fnamemodify(base_dir .. "/" .. entry.name, ":p") -- Create absolute path

        if filepath and filepath ~= "" then
            local command = vim.fn.input("Shell command: ", "", "shellcmd")
            if command and command ~= "" then
                local output = {} -- Table to store command output

                vim.fn.jobstart(command .. " " .. vim.fn.shellescape(filepath), {
                    stdout_buffered = true,
                    stderr_buffered = true,
                    on_stdout = function(_, data)
                        if data then
                            for _, line in ipairs(data) do
                                table.insert(output, line)
                            end
                        end
                    end,
                    on_stderr = function(_, data)
                        if data then
                            for _, line in ipairs(data) do
                                table.insert(output, line)
                            end
                        end
                    end,
                    on_exit = function()
                        -- Display the output in a floating window
                        if #output > 0 then
                            local buf = vim.api.nvim_create_buf(false, true)
                            vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)
                            vim.api.nvim_open_win(buf, true, {
                                relative = "editor",
                                width = math.floor(vim.o.columns * 0.8),
                                height = math.floor(vim.o.lines * 0.8),
                                row = math.floor(vim.o.lines * 0.1),
                                col = math.floor(vim.o.columns * 0.1),
                                style = "minimal",
                                border = "rounded",
                            })
                        else
                            print("No output from command.")
                        end
                    end,
                })
            end
        else
            print("Failed to resolve file path.")
        end
    else
        print("Cursor is not on a file.")
    end
end, { desc = "Execute shell command on file under cursor and show output" })

vim.keymap.set('n', '<localleader>cl', ':<C-u>colorscheme kanagawa-lotus<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<localleader>cd', ':<C-u>colorscheme kanagawa<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<localleader>t', ':<C-u>split +term<CR>', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'x' }, 's', '<Nop>')
-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
return {}
