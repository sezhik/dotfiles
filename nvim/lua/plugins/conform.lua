local function get_go_module_path()
  if vim.fn.executable("go") ~= 1 then
    return nil
  end

  local module = vim.fn.trim(vim.fn.system("go list -m"))
  if vim.v.shell_error ~= 0 then
    return nil
  end

  module = module:gsub("\n", ",")

  return module
end

local function add_local(_)
  local module_path = get_go_module_path()
  if not module_path then
    return {}
  end

  return { "-local", module_path }
end

local function goimports_if_clean()
  local diagnostics = vim.diagnostic.get(0) or {}
  for _, d in ipairs(diagnostics) do
    if d.severity == vim.diagnostic.severity.ERROR then
      return "" -- есть ошибки, не форматируем тк goimports в этом случае очень медленно работает
    end
  end

  return "goimports"
end

return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts.formatters = opts.formatters or {}

    opts.formatters.goimports_local_fast = {
      command = goimports_if_clean,
      args = add_local,
      stdin = true,
    }

    opts.formatters_by_ft = opts.formatters_by_ft or {}
    opts.formatters_by_ft.go = { "goimports_local_fast" }
    opts.formatters_by_ft.yaml = {}
    opts.formatters_by_ft.javascript = { "eslint_d", "prettierd" }
    opts.formatters_by_ft.typescript = { "eslint_d", "prettierd" }
    opts.formatters_by_ft.vue = { "eslint_d", "prettierd" }
    opts.formatters_by_ft.sql = { "pg_format" }
  end,
}
