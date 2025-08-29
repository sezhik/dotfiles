return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- 👈 показывает скрытые файлы и gitignored по умолчанию
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
}
