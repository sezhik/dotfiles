return {
  "folke/snacks.nvim",
  keys = {
    { "<leader>fR", LazyVim.pick("oldfiles"), desc = "Recent custom" },
    {
      "<leader>fr",
      function()
        Snacks.picker.recent({ filter = { cwd = true } })
      end,
      desc = "Recent (cwd) custom",
    },
  },
}
