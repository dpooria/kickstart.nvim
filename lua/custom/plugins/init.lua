-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
    -- { 'github/copilot.vim' },
    { 'ThePrimeagen/harpoon' },
    {
        'morhetz/gruvbox',
        name = 'gruvbox',
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.gruvbox_italic = 1
            --     vim.cmd 'colorscheme gruvbox'
        end,
    },
    {
        'sho-87/kanagawa-paper.nvim',
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        'rebelot/kanagawa.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            -- Default options:
            require('kanagawa').setup {
                -- compile = false,             -- enable compiling the colorscheme
                -- undercurl = true,            -- enable undercurls
                -- commentStyle = { italic = true },
                -- functionStyle = {},
                -- keywordStyle = { italic = true},
                -- statementStyle = { bold = true },
                -- typeStyle = {},
                -- transparent = true, -- do not set background color
                -- dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
                -- terminalColors = true,       -- define vim.g.terminal_color_{0,17}
                -- colors = {                   -- add/modify theme and palette colors
                --     palette = {},
                --     theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
                -- },
                -- overrides = function(colors) -- add/modify highlights
                --     return {}
                -- end,
                theme = 'wave',      -- Load "wave" theme when 'background' option is not set
                background = {       -- map the value of 'background' option to a theme
                    dark = 'dragon', -- try "dragon" !
                    light = 'lotus',
                },
            }
            -- setup must be called before loading
            vim.cmd 'colorscheme kanagawa'
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
    },
    --isort
    {
        'stsewd/isort.nvim',
        build = ':UpdateRemotePlugins',
        -- -- Optionally, add any configuration for isort.nvim here
        -- config = function()
        -- 	-- Example configuration for isort.nvim
        -- 	vim.g.isort_command = "Isort"
        -- end,
    },
    {
        'lervag/vimtex',
        lazy = false, -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            -- Enable filetype detection, plugins, and indentation
            vim.cmd('filetype plugin indent on')

            -- Enable syntax highlighting
            vim.cmd('syntax enable')


            -- Configure the compiler for VimTeX
            -- vim.g.vimetex_compiler_method = 'pdflatex'
            vim.g.vimtex_compiler_latexmk = {
                executable = 'latexmk',
                options = {
                    '-xelatex', -- Specifies the use of XeLaTeX
                    '-file-line-error',
                    '-synctex=1',
                    '-interaction=nonstopmode',
                    '-shell-escape'
                },
            }

            -- Configure the viewer method for VimTeX
            vim.g.vimtex_view_skim_sync = 1
            vim.g.vimtex_view_skim_activate = 1
            vim.g.vimtex_view_method = 'sioyek'
        end,
    },
    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
        end,
    },
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { { 'echasnovski/mini.icons', opts = {} } },
        -- dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if prefer nvim-web-devicons
        -- tj config
        config = function()
            CustomOilBar = function()
                local path = vim.fn.expand '%'
                path = path:gsub('oil://', '')
                return '  ' .. vim.fn.fnamemodify(path, ':.')
            end

            require('oil').setup {
                columns = { 'icon' },
                keymaps = {
                    ['<C-h>'] = false,
                    ['<C-l>'] = false,
                    ['<C-k>'] = false,
                    ['<C-j>'] = false,
                    ['<M-h>'] = 'actions.select_split',
                },
                win_options = {
                    winbar = '%{v:lua.CustomOilBar()}',
                },
                view_options = {
                    show_hidden = true,
                },
            }

            -- Open parent directory in current window
            vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

            -- Open parent directory in floating window
            vim.keymap.set('n', '<space>-', require('oil').toggle_float)
        end,
    },
    { 'tpope/vim-fugitive' },
    {
        "NeogitOrg/neogit",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("neogit").setup({
                disable_commit_confirmation = true,
                integrations = { diffview = true }, -- if you also use diffview.nvim
            })
            vim.keymap.set("n", "<leader>gg", function() require("neogit").open() end, { desc = "Neogit" })
        end,
    },
    {
        'kylechui/nvim-surround',
        version = '*', -- Use for stability; omit to use `main` branch for the latest features
        event = 'VeryLazy',
        config = function()
            require('nvim-surround').setup {
                -- Configuration here, or leave empty to use defaults
            }
        end,
    },
    {
        'rrethy/vim-hexokinase',
        build = 'make hexokinase',
        event = 'BufRead', -- This will lazy-load the plugin when a buffer is read
    },
    {
        'monaqa/dial.nvim',
        config = function()
            local augend = require 'dial.augend'
            require('dial.config').augends:register_group {
                default = {
                    augend.integer.alias.decimal,
                    augend.integer.alias.hex,
                    augend.date.alias['%Y/%m/%d'],
                },
                typescript = {
                    augend.integer.alias.decimal,
                    augend.integer.alias.hex,
                    augend.constant.new { elements = { 'let', 'const' } },
                },
                visual = {
                    augend.integer.alias.decimal,
                    augend.integer.alias.hex,
                    augend.date.alias['%Y/%m/%d'],
                    augend.constant.alias.alpha,
                    augend.constant.alias.Alpha,
                    augend.constant.alias.bool,
                    augend.constant.new { elements = { 'True', 'False' } },
                    --months
                    augend.constant.new {
                        elements = { 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December' },
                    },
                    --month abbreviations
                    augend.constant.new {
                        elements = { 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec' },
                    },
                },
            }

            -- change augends in VISUAL mode
            -- vim.keymap.set('v', '<C-a>', require('dial.map').inc_visual 'visual', { noremap = true })
            -- vim.keymap.set('v', '<C-x>', require('dial.map').dec_visual 'visual', { noremap = true })
            vim.keymap.set('v', '<C-a>', '<cmd>DialIncrement visual<CR>gv', { noremap = true })
            vim.keymap.set('v', '<C-x>', '<cmd>DialDecrement visual<CR>gv', { noremap = true })
        end,
    },
}
