-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'github/copilot.vim' },
  { 'ThePrimeagen/harpoon' },
  {
    'NvChad/nvterm',
    config = function()
      require('nvterm').setup()
    end,
  },
  {
    'stsewd/isort.nvim',
    build = ':UpdateRemotePlugins',
  },
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
}
