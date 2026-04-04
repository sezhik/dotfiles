vim.cmd.colorscheme("catppuccin")

vim.opt.confirm = true
vim.opt.swapfile = false

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
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.lsp.foldexpr()"
vim.opt.foldlevel = 99

vim.o.winborder = 'rounded'
