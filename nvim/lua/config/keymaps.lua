-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.opt.langmap =
  "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯХЪЖ%;ABCDEFGHIJKLMNOPQRSTUVWXYZ{}:$,фисвуапршолдьтщзйкыегмцчняхъ;abcdefghijklmnopqrstuvwxyz[]"

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
