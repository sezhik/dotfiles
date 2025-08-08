return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 2000,
    lazy = false,
    opts = {
      flavour = "macchiato",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
