vim.opt.langmap =
	"ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯХЪЖ%;ABCDEFGHIJKLMNOPQRSTUVWXYZ{}:$,фисвуапршолдьтщзйкыегмцчняхъ;abcdefghijklmnopqrstuvwxyz[]"

vim.keymap.set("i", "jj", "<Esc>", { silent = true, noremap = true })
vim.keymap.set("i", "JJ", "<Esc>", { silent = true, noremap = true })
vim.keymap.set("i", "jJ", "<Esc>", { silent = true, noremap = true })
vim.keymap.set("i", "Jj", "<Esc>", { silent = true, noremap = true })

vim.keymap.set("i", "оо", "<Esc>", { silent = true, noremap = true })
vim.keymap.set("i", "ОО", "<Esc>", { silent = true, noremap = true })
vim.keymap.set("i", "оО", "<Esc>", { silent = true, noremap = true })
vim.keymap.set("i", "Оо", "<Esc>", { silent = true, noremap = true })

-- Навигация по Control
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })

vim.keymap.set("n", "<C-р>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-о>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-л>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-д>", "<C-w>l", { noremap = true })

vim.keymap.set("n", "-", "<cmd>Oil<CR>", { noremap = true })
vim.keymap.set("n", "<leader>`", "<C-^>", { desc = "Go to prev file" })

-- чтобы выделение не сбрасывалось после сдвига
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })

-- по нажатию Esc убирать highlight
vim.keymap.set("n", "<Esc>", "<C-C>:nohlsearch<CR><Esc>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- split окон
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split horizontally" })

vim.keymap.set("n", "<leader>qq", "<cmd>qa<CR>", { desc = "Quit" })
