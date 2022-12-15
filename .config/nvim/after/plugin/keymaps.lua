local g = vim.g
local api = vim.api
local keymap = vim.keymap.set

-- Space as leader key
-- keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = ""
g.maplocalleader = ","
-- save some time for the tinkers
keymap("n", "<leader>l", ":luafile%<CR>", { noremap = true, silent = true })

-- Word wrap
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- jk to ESC
keymap("i", "jk", "<ESC>", { noremap = true, silent = true })
keymap("n", "<leader>n", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- navigate buffers
keymap("n", "<C-n>", ":bn<CR>", { noremap = true, silent = true }) -- next buffer
keymap("n", "<C-p>", ":bp<CR>", { noremap = true, silent = true }) -- previous buffer
keymap("n", "<C-d>", ":bd<CR>", { noremap = true, silent = true }) -- delete buffer

-- fzf
keymap("n", "ff", ":Files<CR>", { noremap = true, silent = true }) -- find files
keymap("n", "fr", ":Rg<CR>", { noremap = true, silent = true }) -- RipGrep

local keys = {
  ['cr']        = vim.api.nvim_replace_termcodes('<CR>', true, true, true),
  ['ctrl-y']    = vim.api.nvim_replace_termcodes('<C-y>', true, true, true),
  ['ctrl-y_cr'] = vim.api.nvim_replace_termcodes('<C-y><CR>', true, true, true),
}

_G.cr_action = function()
  if vim.fn.pumvisible() ~= 0 then
    -- If popup is visible, confirm selected item or add new line otherwise
    local item_selected = vim.fn.complete_info()['selected'] ~= -1
    return item_selected and keys['ctrl-y'] or keys['ctrl-y_cr']
  else
    -- If popup is not visible, use plain `<CR>`. You might want to customize
    -- according to other plugins. For example, to use 'mini.pairs', replace
    -- next line with `return require('mini.pairs').cr()`
    return keys['cr']
  end
end

api.nvim_set_keymap('i', '<CR>', 'v:lua._G.cr_action()', { noremap = true, expr = true })
