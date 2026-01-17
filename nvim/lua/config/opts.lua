vim.cmd.colorscheme("catppuccin")

-- чтобы вим спрашивал перед выходом сохранить ли файл
vim.opt.confirm = true

-- номера строк
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- чтобы не показывалась пустая строка внизу
vim.opt.cmdheight = 0

-- табы
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- fold
vim.o.foldmethod = "indent"
vim.o.foldlevel = 99
