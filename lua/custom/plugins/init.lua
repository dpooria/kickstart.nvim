-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'github/copilot.vim' },
  { 'ThePrimeagen/harpoon' },
  {
    'morhetz/gruvbox',
    name = 'gruvbox',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_italic = 1
      vim.cmd 'colorscheme gruvbox'
    end,
  },
  { 'nvim-treesitter/nvim-treesitter-context' },
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
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = 'sioyek'
    end,
  },
}
