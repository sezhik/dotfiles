local function get_go_module_path()
  local modpath = vim.fn.findfile("go.mod", ".;")
  if modpath == "" then
    return nil
  end

  local lines = vim.fn.readfile(modpath)
  for _, line in ipairs(lines) do
    local mod = line:match("^module%s+(.+)")
    if mod then
      return mod
    end
  end

  return nil
end

return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts.formatters = opts.formatters or {}

    opts.formatters.goimports_local = {
      command = "goimports",
      args = function(bufnr)
        local module_path = get_go_module_path()
        if module_path then
          return { "-local", module_path }
        end
        return {}
      end,
      stdin = true,
    }

    opts.formatters_by_ft = opts.formatters_by_ft or {}
    opts.formatters_by_ft.go = { "goimports_local", "gofumpt" }
    opts.formatters_by_ft.yaml = {}
  end,
}
