return {
  "ahmedkhalf/project.nvim",
  opts = {
    detection_methods = { "lsp", "pattern" },
    patterns = { ".git", "go.mod", "package.json", ".project" },
    manual_mode = false,
    silent_chdir = true,
  },
}
