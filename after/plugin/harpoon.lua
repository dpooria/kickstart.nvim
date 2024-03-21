if not vim.g.vscode then
  local mark = require 'harpoon.mark'
  local ui = require 'harpoon.ui'
  vim.keymap.set('n', '<leader>ha', mark.add_file)
  vim.keymap.set('n', '<leader>hr', mark.rm_file)
  vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)
  -- vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
  -- vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
  -- vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
  -- vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
  -- vim.keymap.set("n", "<Tab><Tab>", ui.nav_next)
  -- vim.keymap.set("n", "<leader><Tab><Tab>", ui.nav_prev)
end
