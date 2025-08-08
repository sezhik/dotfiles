-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function escape(str)
  -- You need to escape these characters to work correctly
  local escape_chars = [[;,."|\]]
  return vim.fn.escape(str, escape_chars)
end

-- Recommended to use lua template string
local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]

vim.opt.langmap = vim.fn.join({
  -- | `to` should be first     | `from` should be second
  escape(ru_shift)
    .. ";"
    .. escape(en_shift),
  escape(ru) .. ";" .. escape(en),
}, ",")

vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "jJ", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "Jj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "JJ", "<Esc>", { noremap = true, silent = true })

vim.keymap.set("i", "оо", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "Оо", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "оО", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "ОО", "<Esc>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-р>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-о>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-л>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-д>", "<C-w>l", { noremap = true })
